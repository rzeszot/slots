import SwiftUI

@Observable final class ProductRepository {
    var products: [Product] = Product.fixtures.example
}
