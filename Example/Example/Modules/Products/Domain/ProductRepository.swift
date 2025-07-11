import SwiftUI

@Observable final class ProductRepository {
    var products: [Product] = [
        Product(id: 1, name: "Foo"),
        Product(id: 2, name: "Bar"),
        Product(id: 3, name: "Baz")
    ]
}
