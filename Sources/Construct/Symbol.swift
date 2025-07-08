import Foundation

struct Symbol: Hashable {
    private let id: ObjectIdentifier
    private let name: String

    init(_ type: (some Any).Type) {
        id = ObjectIdentifier(type)
        name = "\(Swift.type(of: type))"
    }
}
