import SwiftUI

public struct SlotComponent: SlotContent {
    let store: SlotsStore

    public var body: some SlotContent {
        fatalError("SlotComponent.body should never be called")
    }
}

extension SlotComponent {
    init(stores: [SlotsStore]) {
        self.init(store: stores.joined())
    }
}
