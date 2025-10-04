import SwiftUI

@resultBuilder
@MainActor
public struct SlotContentBuilder {
    let store: SlotStore

    init(@SlotContentBuilder content: () -> some SlotContent) {
        let result = content()
        let final = result as? SlotComponent
        let store = final?.store

        self.store = store ?? .empty
    }
}

public extension SlotContentBuilder {
    static func buildExpression(_ content: some SlotContent) -> SlotComponent {
        if let item = content as? SlotItem {
            SlotComponent(store: item.store)
        } else if let result = content as? SlotComponent {
            result
        } else {
            buildExpression(content.body)
        }
    }

    static func buildEither(first component: SlotComponent) -> SlotComponent {
        component
    }

    static func buildEither(second component: SlotComponent) -> SlotComponent {
        component
    }

    static func buildBlock(_ components: SlotComponent...) -> SlotComponent {
        SlotComponent(stores: components.map(\.store))
    }
}
