//
//  testSVG.swift
//  swift-svg
//
//  Helper for creating complete SVG elements in snapshot tests.
//

public import SVG
import SVG_Standard

/// Creates a complete SVG element for snapshot testing.
public func testSVG<C: SVG.View>(
    width: W3C_SVG2.Types.Length? = nil,
    height: W3C_SVG2.Types.Length? = nil,
    viewBox: SVG_Standard.Types.ViewBox? = nil,
    @SVG.Builder content: () -> C
) -> some SVG.View {
    SVG_Standard.Document.SVG(
        width: width,
        height: height,
        viewBox: viewBox
    )(content)
}
