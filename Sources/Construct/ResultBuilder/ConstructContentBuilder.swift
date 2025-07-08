import SwiftUI

@resultBuilder
@MainActor
public struct ConstructContentBuilder {
    let store: Store

    init(@ConstructContentBuilder content: () -> some ConstructContent) {
        let result = content()
        let final = result as? ConstructComponent
        let store = final?.store

        self.store = store ?? .empty
    }
}

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
