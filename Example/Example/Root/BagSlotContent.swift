import Slots
import SwiftUI

struct BagSlotContent: SlotContent {
    var body: some SlotContent {
        SlotItem(for: BagSymbol.self) {
            BagView()
        }
    }
}
