import Construct
import SwiftUI

struct MainView: View {
    @State var active: MainSymbol = .products

    var body: some View {
        TabView(selection: $active) {
            Tab("Products", systemImage: "laptopcomputer.and.iphone", value: .products) {
                ConstructView(for: MainSymbol.products)
            }
            Tab("Bag", systemImage: "bag", value: .bag) {
                ConstructView(for: MainSymbol.bag)
            }
        }
    }
}

#Preview {
    MainView()
        .construct(for: MainSymbol.self) { symbol in
            Text(String(describing: symbol))
        }
}
