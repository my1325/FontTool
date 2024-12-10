// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
  
let package = Package(
    name: "FontTool",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "CustomFonts", targets: ["CustomFonts"]),
        .library(name: "AvenirNext", targets: ["AvenirNext"]),
        .library(name: "Avenir", targets: ["Avenir"]),
        .library(name: "Poppins", targets: ["Poppins"]),
        .library(name: "RammettoOne", targets: ["RammettoOne"]),
        .library(name: "Outfit", targets: ["Outfit"]),
        .library(name: "KohinoorTelugu", targets: ["KohinoorTelugu"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "CustomFonts"),
        .target(name: "AvenirNext", dependencies: ["CustomFonts"]),
        .target(name: "Avenir", dependencies: ["CustomFonts"]),
        .target(name: "KohinoorTelugu", dependencies: ["CustomFonts"]),
        .target(
            name: "Poppins",
            dependencies: ["CustomFonts"],
            resources: [
                .process("Fonts/"),
            ]
        ),
        .target(
            name: "RammettoOne",
            dependencies: ["CustomFonts"],
            resources: [
                .process("Fonts/"),
            ]
        ),
        .target(
            name: "Outfit",
            dependencies: ["CustomFonts"],
            resources: [
                .process("Fonts/"),
            ]
        ),
    ]
)
