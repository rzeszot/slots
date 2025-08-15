import SwiftUI

public struct ConstructComponent: ConstructContent {
    let store: ConstructStore

    public var body: some ConstructContent {
        fatalError("ConstructComponent.body should never be called")
    }
}

extension ConstructComponent {
    init(stores: [ConstructStore]) {
        self.init(store: stores.joined())
    }
}
