import Foundation

struct Symbol: Hashable, Comparable, Identifiable {
    let id: ObjectIdentifier
    let name: String
    let type: Any.Type

    init(_ value: (some Any).Type) {
        id = ObjectIdentifier(value)
        name = String(describing: value)
        type = value
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.name < rhs.name
    }
}
