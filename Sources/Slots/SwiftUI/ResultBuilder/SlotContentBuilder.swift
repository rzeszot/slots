import SwiftUI

@resultBuilder
@MainActor
public struct SlotContentBuilder {
    let store: SlotsStore

    init(@SlotContentBuilder content: () -> some SlotContent) {
        let result = content()
        let final = result as? SlotItem
        let store = final?.store

        self.store = store ?? .empty
    }
}

public extension SlotContentBuilder {
    static func buildExpression(_ content: some SlotContent) -> SlotItem {
        if let item = content as? SlotItem {
            item
        } else {
            buildExpression(content.body)
        }
    }

    static func buildEither(first item: SlotItem) -> SlotItem {
        item
    }

    static func buildEither(second item: SlotItem) -> SlotItem {
        item
    }

    static func buildBlock(_ items: SlotItem...) -> SlotItem {
        SlotItem(stores: items.map(\.store))
    }
}
