Pod::Spec.new do |s|
s.name         = "FDDCloudSDK"
s.version      = "0.9.1"
s.summary      = "FDDCloudSDK.FrameWork."
s.homepage     = "http://www.fangdd.com/shanghai"
s.license      = "MIT"
s.author       = { "liuzhipeng" => "liuzhipeng@fangdd.com" }
s.platform     =  :ios, '8.0'
s.source       =  { :git => 'https://github.com/lzpWhite/FDDCloudSDK.git', :tag => s.version}
s.framework    = 'UIKit', 'WebKit', 'Security', 'MessageUI'
s.swift_version = '4.2'
s.vendored_frameworks = "FDDCloudSDK.framework"
s.requires_arc = true
s.prefix_header_contents = '#import "FDDCloudSDK.h"'
s.resources = ['FDDCloudSDK.framework/**/*.bundle']
s.dependency 'Alamofire'
s.dependency 'WebViewJavascriptBridge'
s.dependency 'SwiftyJSON'
s.dependency 'ObjectMapper'
s.dependency 'Toast-Swift'
end
