Pod::Spec.new do |s|
  s.name             = "ElsevierKit"
  s.version          = "1.0.0"
  s.summary          = "Elsevier API client written in Swift"

  s.description      = <<-DESC
  Elsevier API client written in Swift.
                       DESC

  s.homepage         = "https://github.com/YutoMizutani/ElsevierKit"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Yuto Mizutani" => "yuto.mizutani.dev@gmail.com" }
  s.source           = { :git => "https://github.com/YutoMizutani/ElsevierKit.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/EXPENSIVE_MAN'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '4.0'
  s.tvos.deployment_target = '11.0'

  s.requires_arc = true

  s.source_files = 'Sources/**/*.swift'
  s.swift_version = '4.2'
end
