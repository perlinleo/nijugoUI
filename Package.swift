// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "nijugoUI",
    platforms: [
        .iOS(.v16),
        .watchOS(.v9)
    ],
    products: [
        .library(
            name: "nijugoUI",
            targets: ["nijugoUI"]),
    ],
    targets: [
        .target(
            name: "nijugoUI"),
        .testTarget(
            name: "nijugoUITests",
            dependencies: ["nijugoUI"]
        ),
    ]
)
