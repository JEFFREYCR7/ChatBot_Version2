// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SettingsModule",
    platforms: [.macOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SettingsModule",
            targets: ["SettingsModule"]),
    ],
    
    dependencies: [
        .package(name: "CoreExtensions", path: "../CoreExtensions"),
        .package(url: "https://github.com/kevinhermawan/OllamaKit.git", .upToNextMajor(from: "5.0.4")),
        .package(url: "https://github.com/kevinhermawan/ViewState.git", .upToNextMajor(from: "1.2.2")),
        .package(url: "https://github.com/sindresorhus/Defaults.git", .upToNextMajor(from: "8.2.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SettingsModule",
            dependencies: ["CoreExtensions", "OllamaKit", "ViewState", "Defaults"]
        ),
        .testTarget(
            name: "SettingsModuleTests",
            dependencies: ["SettingsModule"]),
    ]
)
