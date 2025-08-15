import SwiftUI

public struct ConstructStore {
    let storage: [Symbol: ConstructBlock]

    public subscript(_ type: (some Any).Type) -> ConstructBlock? {
        storage[Symbol(type)]
    }

    var count: Int {
        storage.count
    }

    func appending(symbol: Symbol, block: ConstructBlock) -> Self {
        var copy = storage
        copy[symbol] = block
        return Self(storage: copy)
    }

    func appending<T>(block: @escaping (T) -> some View) -> Self {
        appending(symbol: Symbol(T.self), block: ConstructBlock(block))
    }

    func merging(_ other: Self) -> Self {
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

extension [ConstructStore] {
    func joined() -> ConstructStore {
        reduce(.empty) { result, store in
            result.merging(store)
        }
    }
}
