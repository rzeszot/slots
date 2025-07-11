import SwiftUI

struct RootView: View {
    var body: some View {
        MainView()
            .construct {
                MainConstructContent()
                ProductsConstructContent()
                BagConstructContent()
            }
    }
}

#Preview {
    RootView()
}
