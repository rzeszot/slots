import SwiftUI

public protocol SlotExample {
    static var value: Self { get }
}

extension SlotExample {
    @MainActor
    static var view: some View {
        SlotView(for: Self.value)
    }
}

extension Int: SlotExample {
    public static var value: Int {
        42
    }
}

extension String: SlotExample {
    public static var value: String {
        "Hello world!"
    }
}

extension MissingSymbol: SlotExample {
    public static var value: MissingSymbol {
        MissingSymbol(type: String.self)
    }
}
