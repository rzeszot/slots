import Construct
import SwiftUI

struct ProductsConstructContent: ConstructContent {
    var body: some ConstructContent {
        ConstructItem(for: ProductsSymbol.self) { placeholder in
            switch placeholder {
            case .list:
                ProductsView()
            case let .details(product):
                ProductDetailsView(product: product)
            }
        }
    }
}
