// swift-tools-version: 6.1

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
