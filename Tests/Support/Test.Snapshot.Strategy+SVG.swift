//
//  Test.Snapshot.Strategy+SVG.swift
//  swift-svg-rendering
//
//  Snapshot strategy for SVG rendering.
//

public import SVG_Rendering
import Test_Snapshot_Primitives

extension Test.Snapshot.Strategy where Value: SVG.View, Format == String {
    public static var svg: Self {
        .svg()
    }

    public static func svg(
        configuration: SVG.Context.Configuration = .pretty
    ) -> Self {
        Test.Snapshot.Strategy<String, String>.lines.pullback { value in
            String(value, configuration: configuration)
        }
    }
}
