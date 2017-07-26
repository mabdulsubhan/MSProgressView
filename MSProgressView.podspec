Pod::Spec.new do |s|
s.platform = :ios
s.ios.deployment_target = '9.0'
s.name = "MSProgressView"
s.summary = "A simple and elegant swift iOS progress view."
s.requires_arc = true
s.version = "0.1.1"
s.license = { :type => "MIT", :file => "LICENSE" }
s.author = { "Muhammad Abdul Subhan" => "subhan.mps@gmail.com" }
s.homepage = "https://github.com/mabdulsubhan/MSProgressView"
s.source = { :git => "https://github.com/mabdulsubhan/MSProgressView.git", :tag => "#{s.version}"}
s.framework = "UIKit"
s.dependency 'PocketSVG'
s.source_files = "MSProgressView/Classes/*.{swift}"
end
