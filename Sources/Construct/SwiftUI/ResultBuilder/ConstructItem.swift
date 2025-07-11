import SwiftUI

public struct ConstructItem: ConstructContent {
    let symbol: Symbol
    let block: Block

    public var body: some ConstructContent {
        fatalError("ConstructItem.body should never be called")
    }

    var store: Store {
        [symbol: block]
    }
}

public extension ConstructItem {
    init<T>(for symbol: T.Type, @ViewBuilder block: @escaping (_ symbol: T) -> some View) {
        self.init(symbol: Symbol(symbol), block: Block(block))
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
