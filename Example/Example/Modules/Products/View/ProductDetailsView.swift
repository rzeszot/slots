import SwiftUI

struct ProductDetailsView: View {
    let product: Product

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(verbatim: product.name)
                    Text(verbatim: String(product.id))
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .navigationTitle(product.name)
    }
}

#Preview {
    ProductDetailsView(
        product: Product(
            id: 1,
            name: "Foo bar"
        )
    )
}
