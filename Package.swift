// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Slots",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "Slots",
            targets: [
                "Slots",
            ]
        ),
    ],
    targets: [
        .target(
            name: "Slots",
            resources: [
                .process("Resources/Error.xcstrings")
            ]
        ),
        .testTarget(
            name: "SlotsTests",
            dependencies: [
                "Slots",
            ]
        ),
    ]
)
