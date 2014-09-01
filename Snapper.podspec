Pod::Spec.new do |s|
  s.name         = "Snapper"
  s.version      = "0.50"
  s.summary      = "An App.net client library for iOS and Mac."

  s.homepage     = "https://github.com/exsortis/Snapper"
  s.license      = 'MIT'
  s.author       = { "Paul Schifferer" => "paul@schifferers.net" }

  s.source       = { :git => "https://github.com/exsortis/Snapper.git", :tag => "0.50" }
  s.source_files = 'Snapper', 'Snapper/**/*.{h,m}'
  s.framework    = 'Foundation'

  s.ios.deployment_target = '7.1'
  s.osx.deployment_target = '10.9'
  s.requires_arc = true
  
  s.dependency 'Mantle', '~> 1.5'
end
