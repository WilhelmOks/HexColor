// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HexColor",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v9),
    ],
    products: [
        .library(
            name: "HexNSColor",
            targets: ["HexNSColor"]),
        .library(
            name: "HexUIColor",
            targets: ["HexUIColor"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "HexColor",
            dependencies: []),
        .target(
            name: "HexNSColor",
            dependencies: ["HexColor"]),
        .target(
            name: "HexUIColor",
            dependencies: ["HexColor"]),
        .testTarget(
            name: "HexColorTests",
            dependencies: ["HexColor"]),
    ]
)
