import Construct
import SwiftUI

struct ProductsView: View {
    @State var path = NavigationPath()
    @State var repository = ProductRepository()

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
        .environment(repository)
    }
}

#Preview {
    ProductsView()
}
