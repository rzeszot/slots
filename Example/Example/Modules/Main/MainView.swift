import Slots
import SwiftUI

struct MainView: View {
    @State var active: MainSymbol = .products

    var body: some View {
        TabView(selection: $active) {
            Tab("Products", systemImage: "laptopcomputer.and.iphone", value: .products) {
                SlotView(for: MainSymbol.products)
            }
            Tab("Bag", systemImage: "bag", value: .bag) {
                SlotView(for: MainSymbol.bag)
            }
            Tab("Inspect", systemImage: "ant", value: .inspect) {
                SlotView(for: MainSymbol.inspect)
            }
            Tab("Test", systemImage: "testtube.2", value: .test) {
                SlotView(for: MainSymbol.test)
            }
        }
    }
}

#Preview {
    MainView()
        .slot(for: MainSymbol.self) { symbol in
            Text(String(describing: symbol))
        }
}
