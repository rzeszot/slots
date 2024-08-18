import Construct
import SwiftUI

struct MainView: View {
    enum Child {
        case products
        case bag
    }

    @State var active: Child = .products

    var body: some View {
        TabView(selection: $active) {
            ConstructView(for: MainPlaceholder.products)
                .tabItem {
                    Label("Products", systemImage: "laptopcomputer.and.iphone")
                }
                .tag(Child.products)
            ConstructView(for: MainPlaceholder.bag)
                .tabItem {
                    Label("Bag", systemImage: "bag")
                }
                .tag(Child.bag)
            ConstructView(for: 42)
                .tabItem {
                    Label("Missing", systemImage: "lightbulb.min.badge.exclamationmark")
                }
        }
    }
}

#Preview {
    MainView()
}
