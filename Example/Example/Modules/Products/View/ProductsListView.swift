import Construct
import SwiftUI

struct ProductsListView: View {
    @Environment(ProductRepository.self) var repository

    var body: some View {
        List(repository.products) { product in
            NavigationLink(value: ProductsLink.details(product)) {
                VStack(alignment: .leading) {
                    Text(verbatim: product.name)
                    Text(verbatim: String(product.id))
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .navigationTitle("Products")
    }
}

#Preview {
    NavigationStack {
        ProductsListView()
            .navigationDestination(for: ProductsLink.self) { link in
                Text(String(describing: link))
            }
    }
    .environment(ProductRepository())
}
