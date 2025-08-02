import SwiftUI

struct Store {
    let storage: [Symbol: Block]

    var count: Int {
        storage.count
    }

    subscript(_ type: (some Any).Type) -> Block? {
        storage[Symbol(type)]
    }

    func appending(symbol: Symbol, block: Block) -> Self {
        var copy = storage
        copy[symbol] = block
        return Self(storage: copy)
    }

    func appending<T>(block: @escaping (T) -> some View) -> Self {
        appending(symbol: Symbol(T.self), block: Block(block))
    }

    func merging(_ other: Store) -> Self {
        let storage = storage.merging(other.storage) { _, new in new }
        return Self(storage: storage)
    }

    func appending(item: ConstructItem) -> Self {
        appending(symbol: item.symbol, block: item.block)
    }

    static var empty: Self {
        Self(storage: [:])
    }
}

extension [Store] {
    func joined() -> Store {
        reduce(.empty) { result, store in
            result.merging(store)
        }
    }
}
