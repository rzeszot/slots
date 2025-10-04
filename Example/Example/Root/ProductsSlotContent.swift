import Slots
import SwiftUI

struct ProductsSlotContent: SlotContent {
    var body: some SlotContent {
        SlotItem(for: ProductsSymbol.self) { placeholder in
            switch placeholder {
            case .list:
                ProductsRootView()
            case let .details(product):
                ProductDetailsView(product: product)
            }
        }
    }
}
