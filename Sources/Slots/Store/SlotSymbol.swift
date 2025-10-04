import Foundation

public struct SlotSymbol: Hashable, Comparable, Identifiable {
    public let id: ObjectIdentifier
    let name: String
    let type: Any.Type

    init(_ value: (some Any).Type) {
        id = ObjectIdentifier(value)
        name = String(describing: value)
        type = value
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.name < rhs.name
    }
}
