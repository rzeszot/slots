import SwiftUI

public extension View {
    func slot(@SlotContentBuilder content: () -> some SlotContent) -> some View {
        let builder = SlotContentBuilder(content: content)

        return transformEnvironment(\.store) { store in
            store = store.merging(builder.store)
        }
    }
}
