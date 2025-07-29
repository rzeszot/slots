import SwiftUI

struct ConstructStoreReader<Content: View>: View {
    private let content: (Store) -> Content

    @Environment(\.store)
    var store

    init(@ViewBuilder content: @escaping (_ store: Store) -> Content) {
        self.content = content
    }

    var body: some View {
        content(store)
    }
}

#Preview {
    ConstructStoreReader { store in
        Text(store.keys.map(\.name).sorted().joined(separator: ", "))
    }
    .construct(for: Int.self) { value in
        Text("Int: \(value)")
    }
    .construct(for: String.self) { value in
        Text("String: \(value)")
    }
}
