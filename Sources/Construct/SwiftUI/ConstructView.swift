import SwiftUI

public struct ConstructView<T>: View {
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
            ConstructView<MissingSymbol>(for: MissingSymbol(type: T.self))
        }
    }
}

public extension ConstructView {
    static func maybe(for value: T) -> some View {
        ConstructStoreReader { store in
            if store[T.self] != nil {
                ConstructView(for: value)
            }
        }
    }
}

#Preview {
    @Previewable @State var value = true

    let content = VStack {
        Toggle("construct", isOn: $value)
        ConstructView.maybe(for: 42)
    }
    .padding()

    if value {
        content
            .construct(for: Int.self) { value in
                Text("Int: \(value)")
            }
    } else {
        content
    }
}

#Preview {
    ConstructView(for: 42)
        .construct {
            ConstructItem.missing { missing in
                Text("Missing \(String(describing: missing.type))")
            }
            ConstructItem(for: Int.self) { value in
                Text("Value \(String(describing: value))")
            }
        }
}

#Preview {
    ConstructView(for: 42)
        .construct(for: Int.self) { value in
            Text("Int(\(value))")
        }
}
