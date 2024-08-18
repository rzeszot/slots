import SwiftUI

struct ConstructViewModifier<T, C: View>: ViewModifier {
    let constructor: @Sendable (T) -> C

    func body(content: Content) -> some View {
        content
            .transformEnvironment(\.store) { store in
                store.construct(T.self, with: constructor)
            }
    }
}

public extension View {
    func construct<T>(for _: T.Type, @ViewBuilder constructor: @Sendable @escaping (T) -> some View) -> some View {
        modifier(ConstructViewModifier(constructor: constructor))
    }
}

public extension View {
    @inlinable
    func construct<T>(for type: T.Type, @ViewBuilder constructor: @Sendable @escaping () -> some View) -> some View {
        construct(for: type) { _ in
            constructor()
        }
    }
}
