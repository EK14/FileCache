// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FileCache",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "FileCache",
            targets: ["FileCache"]),
    ],
    dependencies: [
        .package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", exact: "3.8.5"),
    ],
    targets: [
        .target(
            name: "FileCache",
            dependencies: [
                .product(name: "CocoaLumberjack", package: "CocoaLumberjack")]
        )
    ]
)
