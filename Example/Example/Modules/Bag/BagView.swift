import SwiftUI

struct BagView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text(verbatim: "empty")
            }
            .navigationTitle("Bag")
        }
    }
}

#Preview {
    BagView()
}
