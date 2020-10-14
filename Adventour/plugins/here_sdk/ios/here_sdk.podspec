#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint heresdk.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'here_sdk'
  s.version          = '4.5.0.0.3276.release'
  s.summary          = 'HERE SDK Flutter plugin'
  s.description      = <<-DESC
HERE SDK flutter plugin.
                       DESC
  s.homepage         = 'http://here.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'HERE' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'
  s.vendored_frameworks='Frameworks/heresdk.framework'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.1'
end
