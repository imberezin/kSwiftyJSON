// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "kSwiftyJSON",
    products: [
        .library(name: "kSwiftyJSON", targets: ["kSwiftyJSON"])
    ],
    targets: [
        .target(name: "kSwiftyJSON",
                dependencies: [],
                resources: [
                    .copy("PrivacyInfo.xcprivacy")
                ]
               ),
        .testTarget(name: "SwiftJSONTests", dependencies: ["kSwiftyJSON"])
    ],
    swiftLanguageVersions: [.v5]
)
