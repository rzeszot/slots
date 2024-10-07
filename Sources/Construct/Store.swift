import SwiftUI

struct Store {
    private var data: [ObjectIdentifier: (Any) -> AnyView]

    private init(data: [ObjectIdentifier: (Any) -> AnyView]) {
        self.data = data
    }

    func find<D>(_ type: D.Type) -> ((Any) -> AnyView)? {
        data[ObjectIdentifier(type)]
    }

    func appending<D>(_ type: D.Type, with block: @escaping (D) -> some View) -> Self {
        var copy = data
        copy[ObjectIdentifier(type)] = { (value: Any) in
            AnyView(block(value as! D))
        }
        return Store(data: copy)
    }

    static var empty: Store {
        .init(data: [:])
    }
}
