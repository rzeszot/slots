import SwiftUI

public struct SlotView<T>: View {
    private let value: T

    @Environment(\.store)
    private var store

    public init(for value: T) {
        self.value = value
    }

    public var body: some View {
        if let builder = store[T.self] {
            builder(value)
        } else if let value = value as? MissingSymbol {
            ErrorView.missing(for: value.type)
        } else {
            SlotView<MissingSymbol>(for: MissingSymbol(type: T.self))
        }
    }
}

public extension SlotView {
    static func maybe(for value: T) -> some View {
        SlotStoreReader { store in
            if store[T.self] != nil {
                SlotView(for: value)
            }
        }
    }
}

//#Preview {
//    @Previewable @State var value = true
//
//    let content = VStack {
//        Toggle("slot", isOn: $value)
//        SlotView.maybe(for: 42)
//    }
//    .padding()
//
//    if value {
//        content
//            .slot(for: Int.self) { value in
//                Text("Int: \(value)")
//            }
//    } else {
//        content
//    }
//}

#Preview {
    SlotView(for: 42)
        .slot {
            SlotItem.missing { missing in
                Text("Missing \(String(describing: missing.type))")
            }
            SlotItem(for: Int.self) { value in
                Text("Value \(String(describing: value))")
            }
        }
}

#Preview {
    SlotView(for: 42)
        .slot(for: Int.self) { value in
            Text("Int(\(value))")
        }
}
