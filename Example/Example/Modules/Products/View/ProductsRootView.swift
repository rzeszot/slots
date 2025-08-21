import Construct
import SwiftUI

struct ProductsRootView: View {
    @State var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            ProductsListView()
                .navigationDestination(for: ProductsLink.self) { link in
                    switch link {
                    case let .details(product):
                        ProductDetailsView(product: product)
                    }
                }
        }
    }
}

#Preview {
    ProductsRootView()
}
