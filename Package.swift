// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "Construct",
    platforms: [
        .iOS(.v17),
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
