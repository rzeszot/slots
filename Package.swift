// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Construct",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "Construct",
            targets: [
                "Construct",
            ]
        ),
    ],
    targets: [
        .target(
            name: "Construct",
            resources: [
                .process("Resources/Error.xcstrings")
            ]
        ),
        .testTarget(
            name: "ConstructTests",
            dependencies: [
                "Construct",
            ]
        ),
    ]
)
