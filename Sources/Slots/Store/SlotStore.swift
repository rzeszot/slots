import SwiftUI

public struct SlotStore {
    let storage: [Symbol: SlotBuilder]

    public subscript(_ type: (some Any).Type) -> SlotBuilder? {
        storage[Symbol(type)]
    }

    var count: Int {
        storage.count
    }

    func appending(symbol: Symbol, builder: SlotBuilder) -> Self {
        var copy = storage
        copy[symbol] = builder
        return Self(storage: copy)
    }

    func appending<T>(builder: @escaping (T) -> some View) -> Self {
        appending(symbol: Symbol(T.self), builder: SlotBuilder(builder))
    }

    func merging(_ other: Self) -> Self {
        let storage = storage.merging(other.storage) { _, new in new }
        return Self(storage: storage)
    }

    func appending(item: SlotItem) -> Self {
        appending(symbol: item.symbol, builder: item.builder)
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
