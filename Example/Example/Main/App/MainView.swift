import Construct
import SwiftUI

struct MainView: View {
    enum Child: Hashable {
        case products
        case bag
    }

    @State var active: Child = .products

    var body: some View {
        TabView(selection: $active) {
            ConstructView(for: ProductsTabLink())
                .tabItem {
                    Label("Products", systemImage: "laptopcomputer.and.iphone")
                }
                .tag(Child.products)
            ConstructView(for: BagLink())
                .tabItem {
                    Label("Bag", systemImage: "bag")
                }
                .tag(Child.bag)
            ConstructView(for: 4)
                .tabItem {
                    Label("Missing", systemImage: "lightbulb.min.badge.exclamationmark")
                }
        }
    }
}

#Preview {
    MainView()
}
