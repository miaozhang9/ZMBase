#
# Be sure to run `pod lib lint ZMBase.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  #库名 
  s.name             = 'ZMBase'
  #库版本
  s.version          = '0.1.0'
  #库简短描述
  s.summary          = 'A short description of ZMBase.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
  #库详细描述
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  #库介绍主页地址
  s.homepage         = 'https://github.com/miaozhang9/ZMBase'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  #库开源许可
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  #作者信息
  s.author           = { 'miaozhang9' => '395052985@qq.com' }
  #源码git地址
  s.source           = { :git => 'https://github.com/miaozhang9/ZMBase.git', :branch => 'master', :tag => s.version.to_s}
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  #库依赖系统版本
  s.ios.deployment_target = '8.0'
  #源码文件配置
  s.source_files = 'ZMBase/Classes/**/*.swift'
  #资源文件配置
  # s.resource_bundles = {
  #   'ZMBase' => ['ZMBase/Assets/*.png']
  # }
  #源码头文件配置
  # s.public_header_files = 'Pod/Classes/**/*.h'
  #系统框架依赖
  # s.frameworks = 'UIKit', 'MapKit'
  #依赖第三方库
  # s.dependency 'AFNetworking', '~> 2.3'
   s.dependency 'SnapKit', '~> 3.2.0'
   s.dependency 'Then', '~> 2.3.0'
end
