# MSProgressView

[![CocoaPods](https://img.shields.io/cocoapods/v/MSProgressView.svg)]()
[![Swift 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![CocoaPods](https://img.shields.io/cocoapods/l/MSProgressView.svg)]()
[![Twitter Follow](https://img.shields.io/twitter/follow/ThisIsSubhan.svg?style=social&label=Follow)](https://twitter.com/thisissubhan)

*A simple and elegant swift iOS progress view.<br>It's an easy to use progress view that will animate on any logo provided in SVG format*

## Features

* Increase or decreasing progress changes.
* Background color.
* Image fill color.
* Image background color.
* Image border color.

## Demo
<p align="left"><img src="https://cdn.rawgit.com/mabdulsubhan/MSProgressView/46e7db98/Screenshots/MSProgressView.gif" /></p>

## Requirements
* Xcode 8
* Swift 3.0
* iOS 8 +

## Installation
### CocoaPods
```
pod 'MSProgressView'
```

## Usage
Initialize the `MSProgressView` using the method :
```
public init(frame: CGRect, BackgroundColor:UIColor, IconColor:UIColor, IconBackgroundColor:UIColor!, IconName:String!, shouldDrawStroke:Bool);
```

To update the progress, you can set the property `progress`

## License
`MSProgressView` is released under an [MIT License][mitLink]. See `LICENSE` for details.


[mitLink]:http://opensource.org/licenses/MIT
