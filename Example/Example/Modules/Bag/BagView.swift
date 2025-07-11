import SwiftUI

struct BagView: View {
    var body: some View {
        NavigationStack {
            Text(verbatim: "empty")
                .navigationTitle("Bag")
        }
    }
}

#Preview {
    BagView()
}
