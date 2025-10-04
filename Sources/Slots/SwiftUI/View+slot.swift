import SwiftUI

public extension View {
    nonisolated func slot<D>(for _: D.Type, @ViewBuilder builder: @escaping (D) -> some View) -> some View {
        transformEnvironment(\.store) { store in
            store = store.appending(builder: builder)
        }
    }

    @inlinable
    nonisolated func slot(for type: (some Any).Type, @ViewBuilder builder: @escaping () -> some View) -> some View {
        slot(for: type) { _ in
            builder()
        }
    }
}
