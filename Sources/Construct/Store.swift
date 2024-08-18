import SwiftUI

typealias Store = [ObjectIdentifier: (Any) -> AnyView]

extension Store {
    func find<D>(_ type: D.Type) -> ((Any) -> AnyView)? {
        self[ObjectIdentifier(type)]
    }

    func appending<D>(_ type: D.Type, with block: @escaping (D) -> some View) -> Self {
        let new = [
            ObjectIdentifier(type): { (value: Any) in
                AnyView(block(value as! D))
            }
        ]

        return self.merging(new) { $1 }
    }
}
