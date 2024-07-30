import SwiftUI

@main
struct ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .construct(for: ProductsTabLink.self) {
                    ProductsView()
                }
                .construct(for: ProductsLink.self) {
                    ProductsListView()
                }
                .construct(for: ProductDetailsLink.self) { link in
                    ProductDetailsView(product: link.product)
                }
                .construct(for: BagLink.self) {
                    BagView()
                }
                .construct(for: MainLink.self) {
                    MainView()
                }
        }
    }
}
