import Construct
import SwiftUI

struct RootView: View {
    var body: some View {
        MainView()
            .construct(for: MainPlaceholder.self) { placeholder in
                switch placeholder {
                case .products:
                    ConstructView(for: ProductsPlaceholder.list)
                case .bag:
                    ConstructView(for: BagPlaceholder())
                case .nesting:
                    NestingView()
                }
            }
            .construct(for: ProductsPlaceholder.self) { placeholder in
                switch placeholder {
                case .list:
                    ProductsView()
                case let .details(product):
                    ProductDetailsView(product: product)
                }
            }
            .construct(for: BagPlaceholder.self) {
                BagView()
            }
    }
}

#Preview {
    RootView()
}
