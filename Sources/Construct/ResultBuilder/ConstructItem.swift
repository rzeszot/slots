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
    init<T>(for type: T.Type, @ViewBuilder block: @escaping (T) -> some View) {
        self.init(symbol: Symbol(type), block: Block(block))
    }

    init(for type: (some Any).Type, @ViewBuilder block: @escaping () -> some View) {
        self.init(for: type) { _ in block() }
    }

    static func missing<T>(_ type: T.Type, @ViewBuilder block: @escaping (T) -> some View) -> Self {
        Self(for: type, block: block)
    }

    static func missing<T>(_ type: T.Type, @ViewBuilder block: @escaping () -> some View) -> Self {
        .missing(type) { _ in block() }
    }
}
