import SwiftUI

public extension View {
    func construct(@ConstructContentBuilder content: () -> some ConstructContent) -> some View {
        let builder = ConstructContentBuilder(content: content)

        return transformEnvironment(\.store) { store in
            store = store.merging(builder.store)
        }
    }
}
