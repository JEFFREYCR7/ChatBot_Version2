// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreViewModels",
    platforms: [.macOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CoreViewModels",
            targets: ["CoreViewModels"]),
    ],
    dependencies: [
        .package(name: "CoreExtensions", path: "../CoreExtensions"),
        .package(name: "CoreModels", path: "../CoreModels"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CoreViewModels",
            dependencies: ["CoreExtensions", "CoreModels"]
        ),
        .testTarget(
            name: "CoreViewModelsTests",
            dependencies: ["CoreViewModels"]),
    ]
)
