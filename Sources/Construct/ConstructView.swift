import SwiftUI

public struct ConstructView<T>: View {
    private let value: T

    @Environment(\.store)
    private var store

    public init(for value: T) {
        self.value = value
    }

    public var body: some View {
        if let builder = store.find(T.self) {
            builder(value)
        } else {
            missing
        }
    }

    @ViewBuilder
    var missing: some View {
        Image(systemName: "exclamationmark.triangle.fill")
            .foregroundStyle(.yellow)
    }
}

#Preview {
    ConstructView(for: 42)
}

#Preview {
    ConstructView(for: 42)
        .construct(for: Int.self) { value in
            Text("Int(\(value))")
        }
}
