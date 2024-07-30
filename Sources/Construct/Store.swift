import SwiftUI

@MainActor
struct Store {
    let constructors: [ObjectIdentifier: (any Hashable) -> AnyView]

    private init(constructors: [ObjectIdentifier: (any Hashable) -> AnyView]) {
        self.constructors = constructors
    }

    init() {
        self.init(constructors: [:])
    }

    func find<T: Hashable>(_ type: T.Type) -> ((T) -> some View)? {
        constructors[ObjectIdentifier(T.self)]
    }

    func construct<T: Hashable>(_ type: T.Type, @ViewBuilder with constructor: @escaping (T) -> some View) -> Self {
        let new = [
            ObjectIdentifier(T.self): { (value: any Hashable) in
                AnyView(constructor(value as! T))
            },
        ]

        return Store(
            constructors: constructors.merging(new) { $1 }
        )
    }
}
