import SwiftUI

@main
struct ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .construct(for: ProductsTabLink.self) {
                    ProductsView()
                }
                .construct(for: ProductsPlaceholder.self) { placeholder in
                    switch placeholder {
                    case .list:
                        ProductsListView()
                    case let .details(product):
                        ProductDetailsView(product: product)
                    }
                }
                .construct(for: BagPlaceholder.self) {
                    BagView()
                }
                .construct(for: MainLink.self) {
                    MainView()
                }
        }
    }
}
