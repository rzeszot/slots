import SwiftUI

public struct SlotStore {
    let storage: [Symbol: SlotBlock]

    public subscript(_ type: (some Any).Type) -> SlotBlock? {
        storage[Symbol(type)]
    }

    var count: Int {
        storage.count
    }

    func appending(symbol: Symbol, block: SlotBlock) -> Self {
        var copy = storage
        copy[symbol] = block
        return Self(storage: copy)
    }

    func appending<T>(block: @escaping (T) -> some View) -> Self {
        appending(symbol: Symbol(T.self), block: SlotBlock(block))
    }

    func merging(_ other: Self) -> Self {
        let storage = storage.merging(other.storage) { _, new in new }
        return Self(storage: storage)
    }

    func appending(item: SlotItem) -> Self {
        appending(symbol: item.symbol, block: item.block)
    }

    static var empty: Self {
        Self(storage: [:])
    }
}

extension [SlotStore] {
    func joined() -> SlotStore {
        reduce(.empty) { result, store in
            result.merging(store)
        }
    }
}
