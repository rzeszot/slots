import SwiftUI

struct RootView: View {
    var body: some View {
        MainView()
            .slot {
                MainSlotContent()
                ProductsSlotContent()
                BagSlotContent()
            }
    }
}

#Preview {
    RootView()
}
