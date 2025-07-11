import Construct
import SwiftUI

struct BagConstructContent: ConstructContent {
    var body: some ConstructContent {
        ConstructItem(for: BagSymbol.self) {
            BagView()
        }
    }
}
