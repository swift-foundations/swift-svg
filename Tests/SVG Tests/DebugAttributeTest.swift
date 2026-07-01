//
//  DebugAttributeTest.swift
//  swift-svg
//

import SVG
import Dimension_Primitives_Test_Support
import Testing

@Suite
struct `Debug Attributes` {

    @Test
    func `Attributes render`() {
        let svgElement = circle(cx: 50, cy: 50, r: 40)
            .fill("red")
            .stroke("black")
            .strokeWidth(3)

        let rendered = String(svgElement)
        #expect(rendered.contains("fill"))
        #expect(rendered.contains("stroke"))
    }
}
