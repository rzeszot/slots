import SwiftUI

public struct SlotBuilder {
    private let build: (Any) -> AnyView

    init<Value>(_ builder: @escaping (Value) -> some View) {
        build = { value in
            if let value = value as? Value {
                AnyView(builder(value))
            } else {
                AnyView(ErrorView.cast(to: Value.self))
            }
        }
    }

    public func callAsFunction(_ value: some Any) -> some View {
        build(value)
    }
}
