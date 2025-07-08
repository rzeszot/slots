import Construct
import SwiftUI

struct RootView: View {
    var body: some View {
        MainView()
            .construct {
                ConstructItem(for: MainPlaceholder.self) { placeholder in
                    switch placeholder {
                    case .products:
                        ConstructView(for: ProductsPlaceholder.list)
                    case .bag:
                        ConstructView(for: BagPlaceholder())
                    case .nesting:
                        NestingView()
                    }
                }
                ProductsConstructItem()
                BagConstructItem()
            }
    }
}

struct ProductsConstructItem: ConstructContent {
    var body: some ConstructContent {
        ConstructItem(for: ProductsPlaceholder.self) { placeholder in
            switch placeholder {
            case .list:
                ProductsView()
            case let .details(product):
                ProductDetailsView(product: product)
            }
        }
    }
}

struct BagConstructItem: ConstructContent {
    var body: some ConstructContent {
        ConstructItem(for: BagPlaceholder.self) {
            BagView()
        }
    }
}

#Preview {
    RootView()
}
