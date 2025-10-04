import SwiftUI

public struct SlotsStore {
    let storage: [SlotSymbol: SlotBuilder]

    var count: Int {
        storage.count
    }

    func appending(symbol: SlotSymbol, builder: SlotBuilder) -> Self {
        var copy = storage
        copy[symbol] = builder
        return Self(storage: copy)
    }

    func appending<T>(builder: @escaping (T) -> some View) -> Self {
        appending(symbol: SlotSymbol(T.self), builder: SlotBuilder(builder))
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

public extension SlotsStore {
    subscript(_ type: (some Any).Type) -> SlotBuilder? {
        storage[SlotSymbol(type)]
    }

    subscript(_ symbol: SlotSymbol) -> SlotBuilder? {
        storage[symbol]
    }
}

extension [SlotsStore] {
    func joined() -> SlotsStore {
        reduce(.empty) { result, store in
            result.merging(store)
        }
    }
}
