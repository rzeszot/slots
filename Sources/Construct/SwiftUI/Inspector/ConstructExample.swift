import SwiftUI

public protocol ConstructExample {
    static var value: Self { get }
}

extension ConstructExample {
    @MainActor
    static var view: some View {
        ConstructView(for: Self.value)
    }
}

extension Int: ConstructExample {
    public static var value: Int {
        42
    }
}

extension String: ConstructExample {
    public static var value: String {
        "Hello world!"
    }
}

extension MissingSymbol: ConstructExample {
    public static var value: MissingSymbol {
        MissingSymbol(type: String.self)
    }
}
