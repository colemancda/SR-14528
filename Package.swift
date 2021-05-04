// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "SR14528",
    products: [
        .executable(
            name: "swift-bug-test",
            targets: ["SR14528"]
        )
    ],
    targets: [
        .target(
            name: "SR14528"
        ),
        .testTarget(
            name: "SR14528Tests",
            dependencies: ["SR14528"]
        ),
    ]
)
