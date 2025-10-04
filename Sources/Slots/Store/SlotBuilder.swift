import SwiftUI

public struct SlotBuilder {
    private let block: (Any) -> AnyView

    init<Value>(_ block: @escaping (Value) -> some View) {
        self.block = { value in
            if let value = value as? Value {
                AnyView(block(value))
            } else {
                AnyView(ErrorView.cast(to: Value.self))
            }
        }
    }

    public func callAsFunction(_ value: Any) -> some View {
        block(value)
    }
}
