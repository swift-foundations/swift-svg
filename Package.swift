// swift-tools-version: 6.3.3

import PackageDescription

extension String {
    static let svg: Self = "SVG"
    var tests: Self { self + " Tests" }
}

extension Target.Dependency {
    static var svg: Self { .target(name: .svg) }
}

extension Target.Dependency {
    static var svgRendering: Self {
        .product(name: "SVG Rendering", package: "swift-svg-render")
    }
}

let package = Package(
    name: "swift-svg",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        .library(name: .svg, targets: [.svg]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-foundations/swift-svg-render.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-dimension-primitives.git", branch: "main"),
    ],
    targets: [
        .target(
            name: .svg,
            dependencies: [
                .svgRendering,
            ]
        ),
        .testTarget(
            name: .svg.tests,
            dependencies: [
                .svg,
                .product(name: "Dimension Primitives Test Support", package: "swift-dimension-primitives"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
