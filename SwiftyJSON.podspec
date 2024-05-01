Pod::Spec.new do |s|
  s.name        = "SwiftyJSON"
  s.version     = "5.0.3"
  s.summary     = "SwiftyJSON makes it easy to deal with JSON data in Swift"
  s.homepage    = "https://github.com/SwiftyJSON/SwiftyJSON"
  s.license     = { :type => "MIT" }
  s.authors     = { "lingoer" => "lingoerer@gmail.com", "tangplin" => "tangplin@gmail.com" }

  s.requires_arc = true
  s.swift_version = "5.0"
  s.osx.deployment_target = "11.0"
  s.ios.deployment_target = "15.0"
  s.watchos.deployment_target = "5.0"
  s.tvos.deployment_target = "15.0"
  s.source   = { :git => "https://github.com/SwiftyJSON/SwiftyJSON.git", :tag => s.version }
  s.source_files = "Source/SwiftyJSON/*.swift"
  s.resource_bundles = {'SwiftyJSON' => ['Source/SwiftyJSON/PrivacyInfo.xcprivacy']}
end
