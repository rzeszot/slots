import SwiftUI

public extension View {
    nonisolated func construct<D>(for _: D.Type, @ViewBuilder constructor: @escaping (D) -> some View) -> some View {
        transformEnvironment(\.store) { store in
            store = store.appending(block: constructor)
        }
    }

    @inlinable
    nonisolated func construct(for type: (some Any).Type, @ViewBuilder constructor: @escaping () -> some View) -> some View {
        construct(for: type) { _ in
            constructor()
        }
    }
}
