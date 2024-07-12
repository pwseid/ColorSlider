// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "ColorSlider",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "ColorSlider",
            targets: ["ColorSlider"]),
    ],
    targets: [
        .target(
            name: "ColorSlider",
            path: "Sources"),
        .testTarget(
            name: "ColorSliderTests",
            dependencies: ["ColorSlider"],
            path: "Tests"),
    ],
    swiftLanguageVersions: [.v5]
)