import SwiftUI

@MainActor
struct Store {
    let constructors: [ObjectIdentifier: (Any) -> AnyView]

    private init(constructors: [ObjectIdentifier: (Any) -> AnyView]) {
        self.constructors = constructors
    }

    init() {
        self.init(constructors: [:])
    }

    func find<T>(_: T.Type) -> ((T) -> some View)? {
        constructors[ObjectIdentifier(T.self)]
    }

    func construct<T>(_ type: T.Type, @ViewBuilder with constructor: @escaping (T) -> some View) -> Self {
        let new = [
            ObjectIdentifier(T.self): { (value: Any) in
                AnyView(constructor(value as! T))
            },
        ]

        return Store(
            constructors: constructors.merging(new) { $1 }
        )
    }
}
