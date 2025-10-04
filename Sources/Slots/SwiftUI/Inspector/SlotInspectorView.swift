import SwiftUI

public struct SlotInspectorView: View {
    @Environment(\.store)
    private var store

    private var items: [Symbol] {
        store.storage.keys.sorted()
    }

    public init() {}

    public var body: some View {
        NavigationStack {
            List(items) { symbol in
                if let type = symbol.type as? (any SlotExample.Type) {
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
            .navigationTitle("Slot Inspector")
        }
    }
}

#Preview {
    VStack {
        SlotInspectorView()
    }
    .slot {
        SlotItem(for: String.self) { value in
            ErrorView(
                title: "String builder",
                message: LocalizedStringResource(String.LocalizationValue(value))
            )
        }
        SlotItem.missing { missing in
            VStack {
                Text("error view for all missing symbols")
                Text(missing.name)
            }
            .padding()
            .background(.pink)
        }
        SlotItem(for: Int.self) { value in
            Text("Value \(String(describing: value))")
        }
        SlotItem(for: Bool.self) { value in
            Text("Value \(String(describing: value))")
        }
    }
}
