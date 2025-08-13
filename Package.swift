// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Construct",
    platforms: [
        .iOS(.v16),
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
            name: "Construct"
        ),
        .testTarget(
            name: "ConstructTests",
            dependencies: [
                "Construct",
            ]
        ),
    ]
)
