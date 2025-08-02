import SwiftUI

typealias Store = [Symbol: Block]

extension Store {
    subscript(_ type: (some Any).Type) -> Block? {
        self[Symbol(type)]
    }

    func appending(symbol: Symbol, block: Block) -> Self {
        var copy = self
        copy[symbol] = block
        return copy
    }

    func appending<T>(block: @escaping (T) -> some View) -> Self {
        appending(symbol: Symbol(T.self), block: Block(block))
    }

    func merging(_ other: Store) -> Self {
        merging(other) { _, new in new }
    }

    func appending(item: ConstructItem) -> Self {
        appending(symbol: item.symbol, block: item.block)
    }

    static var empty: Self {
        [:]
    }
}

extension [Store] {
    func joined() -> Store {
        reduce(.empty) { result, store in
            result.merging(store)
        }
    }
}
