// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ArtemisCore",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ArtemisCore",
            targets: ["ArtemisCore"]),
    ],
    dependencies: [
        .package(url: "https://github.com/devicekit/DeviceKit.git", branch: "master")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ArtemisCore",
            dependencies: [
                .target(name: "artemis-core"),
                .product(name: "DeviceKit", package: "DeviceKit")
            ]),
        .testTarget(
            name: "ArtemisCoreTests",
            dependencies: ["ArtemisCore"]),
        .binaryTarget(
                name: "artemis-core",
                path: "./Sources/artemis_core.xcframework")
    ]
)
