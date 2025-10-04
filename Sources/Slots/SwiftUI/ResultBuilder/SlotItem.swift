import SwiftUI

public struct SlotItem: SlotContent {
    let symbol: SlotSymbol
    let builder: SlotBuilder

    public var body: some SlotContent {
        fatalError("SlotItem.body should never be called")
    }

    var store: SlotStore {
        SlotStore(storage: [symbol: builder])
    }
}

public extension SlotItem {
    init<T>(for symbol: T.Type, @ViewBuilder builder: @escaping (_ symbol: T) -> some View) {
        self.init(symbol: SlotSymbol(symbol), builder: SlotBuilder(builder))
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
