import SwiftUI

struct Store: Sendable {
    private let constructors: [ObjectIdentifier: @Sendable (Any) -> AnyView]

    private init(constructors: [ObjectIdentifier: @Sendable (Any) -> AnyView]) {
        self.constructors = constructors
    }

    init() {
        self.init(constructors: [:])
    }

    func find<T>(_: T.Type) -> ((T) -> some View)? {
        constructors[ObjectIdentifier(T.self)]
    }

    func construct<T>(_ type: T.Type, @ViewBuilder with constructor: @Sendable @escaping (T) -> some View) -> Self {
        let new = [
            ObjectIdentifier(T.self): { @Sendable (value: Any) in
                return AnyView(constructor(value as! T))
            },
        ]

        return Store(
            constructors: constructors.merging(new) { $1 }
        )
    }
}
