// swift-tools-version: 6.4

import PackageDescription

extension String {
    static let svg: Self = "SVG"
    var tests: Self { self + " Tests" }
}

extension Target.Dependency {
    static var svg: Self { .target(name: .svg) }
}

extension Target.Dependency {
    static var rendering: Self {
        .product(name: "SVG Rendering", package: "swift-svg-render")
    }
}

let package = Package(
    name: "swift-svg",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: .svg, targets: [.svg])
    ],
    dependencies: [
        .package(url: "https://github.com/swift-foundations/swift-svg-render.git", branch: "main"),
        .package(
            url: "https://github.com/swift-primitives/swift-dimension-primitives.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: .svg,
            dependencies: [
                .rendering
            ]
        ),
        .testTarget(
            name: .svg.tests,
            dependencies: [
                .svg,
                .product(
                    name: "Dimension Primitives Test Support",
                    package: "swift-dimension-primitives"
                ),
            ],
            // Explicit path: the nested test manifest at Tests/Package.swift makes
            // SwiftPM skip automatic target discovery under Tests/.
            path: "Tests/SVG Tests"
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
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
