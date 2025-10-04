import SwiftUI

struct SlotStoreReader<Content: View>: View {
    private let content: (SlotStore) -> Content

    @Environment(\.store)
    var store

    init(@ViewBuilder content: @escaping (_ store: SlotStore) -> Content) {
        self.content = content
    }

    var body: some View {
        content(store)
    }
}

#Preview {
    SlotStoreReader { store in
        Text(store.storage.keys.map(\.name).sorted().joined(separator: ", "))
    }
    .slot(for: Int.self) { value in
        Text("Int: \(value)")
    }
    .slot(for: String.self) { value in
        Text("String: \(value)")
    }
}
