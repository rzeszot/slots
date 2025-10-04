import SwiftUI

public struct SlotItem: SlotContent {
    let store: SlotsStore

    public var body: some SlotContent {
        fatalError("SlotItem.body should never be called")
    }
}

extension SlotItem {
    init(stores: [SlotsStore]) {
        self.init(store: stores.joined())
    }
}

public extension SlotItem {
    init<T>(for symbol: T.Type, @ViewBuilder builder: @escaping (_ symbol: T) -> some View) {
        let storage = [
            SlotSymbol(symbol): SlotBuilder(builder)
        ]
        let store = SlotsStore(storage: storage)
        self.init(store: store)
    }

    init(for symbol: (some Any).Type, @ViewBuilder builder: @escaping () -> some View) {
        self.init(for: symbol) { _ in builder() }
    }

    static func missing(@ViewBuilder builder: @escaping (_ missing: MissingSymbol) -> some View) -> Self {
        Self(for: MissingSymbol.self, builder: builder)
    }

    static func missing(@ViewBuilder builder: @escaping () -> some View) -> Self {
        .missing { _ in builder() }
    }
}
