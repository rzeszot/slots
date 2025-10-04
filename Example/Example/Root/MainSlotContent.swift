import Slots
import SwiftUI

struct MainSlotContent: SlotContent {
    var body: some SlotContent {
        SlotItem(for: MainSymbol.self) { placeholder in
            switch placeholder {
            case .products:
                SlotView(for: ProductsSymbol.list)
            case .bag:
                SlotView(for: BagSymbol.main)
            case .inspect:
                SlotInspectorView()
            case .test:
                TestView()
            }
        }
    }
}
