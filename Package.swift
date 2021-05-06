// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "SR14528",
    products: [
        .executable(
            name: "swift-bug-test",
            targets: ["BugTool"]
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
