import SwiftUI

public extension View {
    nonisolated func construct<D>(for type: D.Type, @ViewBuilder constructor: @escaping (D) -> some View) -> some View {
        transformEnvironment(\.store) { store in
            store = store.appending(type) { value in
                constructor(value)
            }
        }
    }
}

public extension View {
    @inlinable
    nonisolated func construct<D>(for type: D.Type, @ViewBuilder constructor: @escaping () -> some View) -> some View {
        construct(for: type) { _ in
            constructor()
        }
    }
}
