import Construct
import SwiftUI

struct ProductsView: View {
    @State var path = NavigationPath()
    @ObservedObject var repository = ProductRepository()

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
        .environmentObject(repository)
    }
}

#Preview {
    ProductsView()
}
