// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "OpusKit",
    platforms: [
        .iOS("15.0"),
    ],
    products: [
        .library(
            name: "OpusKit",
            targets: ["OpusKit"]
        ),
    ],
    targets: [
        .target(
            name: "OpusKit"
        )
    ]
)
