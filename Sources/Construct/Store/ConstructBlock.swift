import SwiftUI

public struct ConstructBlock {
    private let build: (Any) -> AnyView

    init<Value>(_ block: @escaping (Value) -> some View) {
        build = { value in
            if let value = value as? Value {
                AnyView(block(value))
            } else {
                AnyView(ErrorView.cast(to: Value.self))
            }
        }
    }

    public func callAsFunction(_ value: some Any) -> some View {
        build(value)
    }
}
