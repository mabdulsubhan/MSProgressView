//
//  MSProgressView.swift
//  MSProgressView
//
//  Created by Muhammad Abdul Subhan on 26/07/2017.
//  Copyright © 2017 Muhammad Abdul Subhan. All rights reserved.
//

import UIKit
import PocketSVG

class MSDefaultColor {
    static let defaultBackgroundColor: UIColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0)
    static let defaultIconColor: UIColor = UIColor(red: 10/255.0, green: 85/255.0, blue: 198/255.0, alpha: 1.0)
}

open class MSProgressView: UIView {
    
    var boxColor: UIColor!
    var iconBgColor: UIColor!
    var iconColor: UIColor!
    var iconName: String!
    var shouldDrawStroke:Bool!
    
    var progress: CGFloat = 0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    private var strokeBezierPath:UIBezierPath = UIBezierPath()
    private let progressLayer = CALayer()
    
    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.boxColor = MSDefaultColor.defaultBackgroundColor
        self.iconColor = MSDefaultColor.defaultIconColor
        self.iconBgColor = MSDefaultColor.defaultBackgroundColor
        self.iconName = "anchor"
        self.setupView()
        shouldDrawStroke = true
    }
    
    public init(frame: CGRect, BackgroundColor:UIColor, IconColor:UIColor, IconBackgroundColor:UIColor!, IconName:String!, shouldDrawStroke:Bool) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.boxColor = BackgroundColor
        self.iconColor = IconColor
        self.iconBgColor = IconBackgroundColor
        self.iconName = IconName
        self.shouldDrawStroke = shouldDrawStroke
        self.setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    // MARK: Private Methods
    
    private func setupView() {
        
        let url = Bundle.main.url(forResource: self.iconName, withExtension: "svg")!
        for path:SVGBezierPath in SVGBezierPath.pathsFromSVG(at: url) {
            strokeBezierPath.append(UIBezierPath(cgPath: path.cgPath))
        }
        strokeBezierPath = (strokeBezierPath.fit(into: CGRect(x: self.frame.size.width/2 - self.frame.size.width*0.3, y: self.frame.size.height/2 - self.frame.size.height*0.3, width: self.frame.size.width*0.6, height: self.frame.size.height*0.6)).moveCenter(to: self.frame.center))
        strokeBezierPath.lineWidth = 1
        strokeBezierPath.lineCapStyle = .round
        strokeBezierPath.lineJoinStyle = .miter
        
        progressLayer.backgroundColor = self.boxColor.cgColor
        self.layer.addSublayer(progressLayer)
        
    }
    
    // MARK: Core Graphics Drawing
    
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        
        drawBackground(rect, color: self.boxColor)
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setStrokeColor(self.iconColor.cgColor)
        context.setFillColor(self.iconColor.cgColor)
        
        strokeBezierPath.fill()
        
        drawProgressFill(rect, percentage: progress)
        
        if(self.shouldDrawStroke) {
            strokeBezierPath.stroke()
        }
    }
    
    private func drawProgressFill(_ rect: CGRect, percentage: CGFloat) {
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(self.iconBgColor.cgColor)
        
        let path = UIBezierPath(rect: CGRect(x: self.frame.size.width/2 - self.frame.size.width*0.3, y: self.frame.size.height/2 - self.frame.size.height*0.3, width: self.frame.size.width*0.6, height: self.frame.size.height*0.6 - (self.frame.size.height*0.6 * (percentage))))
        
        path.addClip()
        strokeBezierPath.addClip()
        
        path.fill()
    }
    
    private func drawBackground(_ rect: CGRect, color: UIColor) {
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 20)
        path.fill()
    }
}
