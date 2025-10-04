import SwiftUI

public struct SlotComponent: SlotContent {
    let store: SlotStore

    public var body: some SlotContent {
        fatalError("SlotComponent.body should never be called")
    }
}

extension SlotComponent {
    init(stores: [SlotStore]) {
        self.init(store: stores.joined())
    }
}
