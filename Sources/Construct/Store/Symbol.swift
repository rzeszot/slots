import Foundation

struct Symbol: Hashable {
    let id: ObjectIdentifier
    let name: String

    init(_ value: (some Any).Type) {
        id = ObjectIdentifier(value)
        name = String(describing: value)
    }
}
