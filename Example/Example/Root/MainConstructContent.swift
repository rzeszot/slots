import Construct
import SwiftUI

struct MainConstructContent: ConstructContent {
    var body: some ConstructContent {
        ConstructItem(for: MainSymbol.self) { placeholder in
            switch placeholder {
            case .products:
                ConstructView(for: ProductsSymbol.list)
            case .bag:
                ConstructView(for: BagSymbol.main)
            case .inspect:
                ConstructInspectorView()
            case .test:
                TestView()
            }
        }
    }
}
