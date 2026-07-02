# swift-svg

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Constructs SVG documents in Swift from composable element builders and renders them to SVG markup.

---

## Key Features

- **Declarative element builders** — Lowercase builders (`svg`, `circle`, `rect`, `path`, `text`) mirror SVG element names one-to-one.
- **Result-builder composition** — Nest children in trailing closures: `defs { linearGradient { stop(…) } }`.
- **Chained attributes** — Presentation attributes apply as methods: `.fill`, `.stroke`, `.strokeWidth`, `.opacity`, `.fontSize`, `.textAnchor`.
- **String rendering** — `String(element)` serializes an element tree to SVG markup.
- **W3C SVG 2 element set** — Shapes, paths, text, gradients, patterns, clipping, masks, markers, and embedded content.
- **Single umbrella import** — One `import SVG` brings the W3C SVG 2 element model and the renderer together.

---

## Quick Start

Elements compose through result builders, attributes chain as methods, and the whole tree serializes with a `String` initializer — no manual tag concatenation or attribute escaping.

```swift
import SVG

let badge = svg(width: 200, height: 200) {
    circle(cx: 100, cy: 100, r: 80)
        .fill("red")
        .stroke("black")
        .strokeWidth(2)

    text(x: 100, y: 105) { "Swift" }
        .fontSize(24)
        .textAnchor("middle")
        .fill("white")
}

let markup = String(badge)  // "<svg width=\"200\" height=\"200\">…</svg>"
```

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-foundations/swift-svg.git", branch: "main")
]
```

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "SVG", package: "swift-svg")
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26.

---

## Community

<!-- BEGIN: discussion -->
*Discussion thread will be created at first public release.*
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE](LICENSE.md).
