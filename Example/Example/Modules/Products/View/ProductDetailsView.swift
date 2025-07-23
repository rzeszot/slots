import SwiftUI

struct ProductDetailsView: View {
    let product: Product

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(verbatim: product.name)
                Text(verbatim: String(product.id))
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .navigationTitle(product.name)
    }
}

#Preview {
    @Previewable @State var path: [Product] = [.fixtures.foo]

    NavigationStack(path: $path) {
        Color.yellow
            .navigationDestination(for: Product.self) { product in
                ProductDetailsView(
                    product: product
                )
            }
    }
}
