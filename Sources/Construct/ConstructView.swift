import SwiftUI

public struct ConstructView<T>: View {
    private let object: T

    @Environment(\.store)
    private var store

    public init(for object: T) {
        self.object = object
    }

    public var body: some View {
        if let builder = store.find(T.self) {
            builder(object)
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
