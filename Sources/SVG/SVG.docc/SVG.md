# ``SVG``

@Metadata {
    @DisplayName("SVG")
    @TitleHeading("Swift Foundations")
}

Lowercase, SVG-like element syntax — `circle(cx:cy:r:)`, `rect(x:y:width:
height:)`, `ellipse(cx:cy:rx:ry:)`, `line`, and the rest of the basic-shape
and structural element set — as typealiases over `swift-svg-standard`'s
typed element types, chainable with `.fill(...)` and the other rendering
modifiers from `swift-svg-render`.

## When to use this

Reach for this package when code composes SVG documents in Swift and wants
markup that reads like the SVG elements it produces (`circle(...)`
`rect(...)`) rather than the fully-qualified typed names. It contributes no
behavior of its own beyond the lowercase syntax layer: the element and
attribute types come from `swift-svg-standard`, and rendering to markup
comes from `swift-svg-render`. Depend on those packages directly when the
lowercase convenience syntax is not needed.

## Topics

### Related packages

- [swift-svg-standard](https://github.com/swift-standards/swift-svg-standard) —
  the typed SVG element and attribute vocabulary this package aliases.
- [swift-svg-render](https://github.com/swift-foundations/swift-svg-render) —
  the rendering layer these elements compose against.
