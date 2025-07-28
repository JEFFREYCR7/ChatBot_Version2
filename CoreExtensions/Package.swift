// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreExtensions",
    platforms: [.macOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CoreExtensions",
            targets: ["CoreExtensions"]),
    ],
    dependencies: [
        .package(url: "https://github.com/sindresorhus/Defaults.git", .upToNextMajor(from: "8.2.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CoreExtensions",
            dependencies: ["Defaults"]
        ),
        
        .testTarget(
            name: "CoreExtensionsTests",
            dependencies: ["Defaults"]),
    ]
)
