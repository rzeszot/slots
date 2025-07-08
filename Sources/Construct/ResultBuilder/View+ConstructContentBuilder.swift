import SwiftUI

public extension View {
    func construct(@ConstructContentBuilder content: () -> some ConstructContent) -> some View {
        let result = content()
        let new = (result as? ConstructComponent)?.store ?? .empty

        return transformEnvironment(\.store) { old in
            old = old.merging(new)
        }
    }
}
