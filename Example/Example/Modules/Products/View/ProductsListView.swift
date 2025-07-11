import Construct
import SwiftUI

struct ProductsListView: View {
    @Environment(ProductRepository.self) var repository

    var body: some View {
        VStack {
            List {
                ForEach(repository.products) { product in
                    NavigationLink(value: ProductsLink.details(product)) {
                        VStack(alignment: .leading) {
                            Text(verbatim: product.name)
                            Text(verbatim: String(product.id))
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                    }
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
                Text("\(link)")
            }
    }
    .environment(ProductRepository())
}
