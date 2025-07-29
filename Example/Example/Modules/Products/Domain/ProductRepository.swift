import SwiftUI

struct ProductRepository {
    func fetch() async throws -> [Product] {
        try await Task.sleep(for: .seconds(2))
        return Product.fixtures.example
    }
}
