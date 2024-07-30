import Construct
import SwiftUI

struct ProductsListView: View {
    @EnvironmentObject
    var repository: ProductRepository

    var body: some View {
        VStack {
            List {
                ForEach(repository.products) { product in
                    NavigationLink(value: ProductDetailsLink(product: product)) {
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
    ProductsListView()
        .environmentObject(ProductRepository())
}
