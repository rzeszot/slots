import SwiftUI

public struct SlotItem: SlotContent {
    let symbol: Symbol
    let block: SlotBlock

    public var body: some SlotContent {
        fatalError("SlotItem.body should never be called")
    }

    var store: SlotStore {
        SlotStore(storage: [symbol: block])
    }
}

public extension SlotItem {
    init<T>(for symbol: T.Type, @ViewBuilder block: @escaping (_ symbol: T) -> some View) {
        self.init(symbol: Symbol(symbol), block: SlotBlock(block))
    }

    init(for symbol: (some Any).Type, @ViewBuilder block: @escaping () -> some View) {
        self.init(for: symbol) { _ in block() }
    }

    static func missing(@ViewBuilder block: @escaping (_ missing: MissingSymbol) -> some View) -> Self {
        Self(for: MissingSymbol.self, block: block)
    }

    static func missing(@ViewBuilder block: @escaping () -> some View) -> Self {
        .missing { _ in block() }
    }
}
