#
# Be sure to run `pod lib lint SFCircleProgressView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SFCircleProgressView'
  s.version          = '0.1.3'
  s.summary          = 'A short description of SFCircleProgressView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Sfh03031/SFCircleProgressView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sfh03031' => 'sfh894645252@163.com' }
  s.source           = { :git => 'https://github.com/Sfh03031/SFCircleProgressView.git', :tag => s.version.to_s }
  s.swift_versions   = '5.0'
  s.platform         = :ios, '12.0'
  s.source_files     = 'SFCircleProgressView/Classes/**/*'
  
end
