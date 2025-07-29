import Construct
import SwiftUI

@Observable final class ProductsListModel {
    enum Phase {
        case loading
        case content([Product])
        case failure(Error)
    }

    private(set) var phase: Phase = .loading
    private let repository = ProductRepository()

    func refresh() {
        phase = .loading
    }

    func reload() async {
        print("xxx reload")
        phase = .loading
        do {
            let products = try await repository.fetch()
            phase = .content(products)
        } catch {
            phase = .failure(error)
        }
    }
}

struct ProductsListView: View {
    var model = ProductsListModel()

    var body: some View {
        content
            .navigationTitle("Products")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        model.refresh()
                    } label: {
                        Image(systemName: "arrow.clockwise.circle")
                    }
                }
            }
    }

    @ViewBuilder var content: some View {
        switch model.phase {
        case .loading:
            ProgressView()
                .task {
                    await model.reload()
                }
        case let .content(products):
            List(products) { product in
                NavigationLink(value: ProductsLink.details(product)) {
                    VStack(alignment: .leading) {
                        Text(verbatim: product.name)
                        Text(verbatim: String(product.id))
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        case let .failure(error):
            Text("Error: \(error.localizedDescription)")
        }
    }
}

#Preview {
    NavigationStack {
        ProductsListView()
            .navigationDestination(for: ProductsLink.self) { link in
                Text(String(describing: link))
            }
    }
//    .environment(ProductRepository())
}
