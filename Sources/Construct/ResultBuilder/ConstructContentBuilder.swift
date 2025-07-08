import SwiftUI

@resultBuilder
@MainActor
public struct ConstructContentBuilder {}

public extension ConstructContentBuilder {
    static func buildExpression(_ content: some ConstructContent) -> ConstructComponent {
        if let item = content as? ConstructItem {
            ConstructComponent(store: item.store)
        } else if let result = content as? ConstructComponent {
            ConstructComponent(store: result.store)
        } else {
            buildExpression(content.body)
        }
    }

    static func buildBlock(_ components: ConstructComponent...) -> ConstructComponent {
        ConstructComponent(stores: components.map(\.store))
    }
}
