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

#Preview {
    ConstructView(for: 42)
        .construct {
            ConstructItem.missing { missing in
                Text("Missing \(missing.type)")
            }
            ConstructItem(for: Int.self) { value in
                Text("Value \(value)")
            }
        }
}

#Preview {
    ConstructView(for: 42)
        .construct(for: Int.self) { value in
            Text("Int(\(value))")
        }
}
