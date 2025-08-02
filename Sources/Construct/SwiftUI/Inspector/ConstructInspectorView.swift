import SwiftUI

public struct ConstructInspectorView: View {
    @Environment(\.store)
    private var store

    private var items: [Symbol] {
        store.storage.keys.sorted()
    }

    public init() {}

    public var body: some View {
        NavigationStack {
            List(items) { symbol in
                if let type = symbol.type as? (any ConstructExample.Type) {
                    NavigationLink {
                        AnyView(type.view)
                            .navigationTitle(symbol.name)
                    } label: {
                        Text(symbol.name)
                    }
                } else {
                    Text(symbol.name)
                }
            }
            .navigationTitle("Construct Inspector")
        }
    }
}

#Preview {
    VStack {
        ConstructInspectorView()
    }
    .construct {
        ConstructItem(for: String.self) { value in
            ErrorView(
                title: Text("String builder"),
                message: Text(value)
            )
        }
        ConstructItem.missing { missing in
            VStack {
                Text("error view for all missing symbols")
                Text(missing.name)
            }
            .padding()
            .background(.pink)
        }
        ConstructItem(for: Int.self) { value in
            Text("Value \(String(describing: value))")
        }
        ConstructItem(for: Bool.self) { value in
            Text("Value \(String(describing: value))")
        }
    }
}
