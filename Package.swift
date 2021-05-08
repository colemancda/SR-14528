// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "SR14528",
    platforms: [
        .macOS(.v10_12)
    ],
    products: [
        .executable(
            name: "swift-bug-test",
            targets: ["BugTool"]
        ),
        .library(
            name: "Bug",
            type: .dynamic,
            targets: ["SR14528"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-argument-parser",
            .upToNextMinor(from: "0.1.0")
        )
    ],
    targets: [
        .target(
            name: "BugTool",
            dependencies: [
                "ArgumentParser",
                "SR14528"
            ]
        ),
        .target(
            name: "SR14528"
        ),
        .testTarget(
            name: "SR14528Tests",
            dependencies: ["SR14528"]
        ),
    ]
)
