import SwiftUI

public extension View {
    func construct(@ConstructContentBuilder content: () -> some ConstructContent) -> some View {
        let result = content()
        let store = (result as? ConstructComponent)?.store ?? .empty

        return transformEnvironment(\.store) { store in
            store = store.merging(store)
        }
    }
}
