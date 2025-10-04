import SwiftUI

public struct SlotsStoreReader<Content: View>: View {
    private let content: (SlotsStore) -> Content

    @Environment(\.store)
    var store

    public init(@ViewBuilder content: @escaping (_ store: SlotsStore) -> Content) {
        self.content = content
    }

    public var body: some View {
        content(store)
    }
}

#Preview {
    SlotsStoreReader { store in
        Text(store.storage.keys.map(\.name).sorted().joined(separator: ", "))
    }
    .slot(for: Int.self) { value in
        Text("Int: \(value)")
    }
    .slot(for: String.self) { value in
        Text("String: \(value)")
    }
}
