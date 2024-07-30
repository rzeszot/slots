import Foundation

final class ProductRepository: ObservableObject {
    @Published var products: [Product]

    init() {
        products = [
            Product(id: 1, name: "Foo"),
            Product(id: 2, name: "Bar"),
        ]
    }
}
