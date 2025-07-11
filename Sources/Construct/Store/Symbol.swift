import Foundation

struct Symbol: Hashable {
    let id: ObjectIdentifier
    let name: String

    init(_ type: (some Any).Type) {
        id = ObjectIdentifier(type)
        name = "\(Swift.type(of: type))"
    }
}
