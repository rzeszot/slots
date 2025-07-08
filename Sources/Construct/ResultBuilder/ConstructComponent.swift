import SwiftUI

public struct ConstructComponent: ConstructContent {
    let store: Store

    public var body: some ConstructContent {
        fatalError("ConstructResult.body should never be called")
    }
}

extension ConstructComponent {
    init(stores: [Store]) {
        self.init(store: stores.joined())
    }
}
