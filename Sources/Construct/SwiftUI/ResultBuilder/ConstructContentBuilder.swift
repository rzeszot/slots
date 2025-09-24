import SwiftUI

@resultBuilder
@MainActor
public struct ConstructContentBuilder {
    let store: ConstructStore

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
            result
        } else {
            buildExpression(content.body)
        }
    }

    static func buildEither(first component: ConstructComponent) -> ConstructComponent {
        component
    }

    static func buildEither(second component: ConstructComponent) -> ConstructComponent {
        component
    }

    static func buildBlock(_ components: ConstructComponent...) -> ConstructComponent {
        ConstructComponent(stores: components.map(\.store))
    }
}
