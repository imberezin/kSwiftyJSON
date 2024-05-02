Pod::Spec.new do |s|
  s.name        = "kSwiftyJSON"
  s.version     = "5.0.8"
  s.summary     = "kSwiftyJSON makes it easy to deal with JSON data in Swift"
  s.homepage    = "https://github.com/imberezin/kSwiftyJSON"
  s.license     = { :type => "MIT" }
  s.authors     = { "lingoer" => "imberezin@gmail.com", "tangplin" => "imberezin@gmail.com" }

  s.requires_arc = true
  s.swift_version = "5.0"
  s.osx.deployment_target = "11.0"
  s.ios.deployment_target = "15.0"
  s.watchos.deployment_target = "5.0"
  s.tvos.deployment_target = "15.0"
  s.source   = { :git => "https://github.com/imberezin/kSwiftyJSON", :tag => s.version }
  s.source_files = "Source/kSwiftyJSON/*.swift"
  s.resource_bundles = {'SwiftyJSON' => ['Source/kSwiftyJSON/PrivacyInfo.xcprivacy']}
end
