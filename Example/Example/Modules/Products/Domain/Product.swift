import Foundation

struct Product: Identifiable, Hashable {
    let id: Int
    let name: String
}

extension Product {
    enum fixtures {
        static let foo = Product(id: 1, name: "Foo")
        static let bar = Product(id: 2, name: "Bar")
        static let baz = Product(id: 3, name: "Baz")

        static let example: [Product] = [
            .fixtures.foo,
            .fixtures.bar,
            .fixtures.baz
        ]
    }
}
