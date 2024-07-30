import SwiftUI

struct StoreEnvironmentKey: EnvironmentKey {
    @MainActor
    static let defaultValue = Store()
}

extension EnvironmentValues {
    @MainActor
    var store: Store {
        get {
            self[StoreEnvironmentKey.self]
        }
        set {
            self[StoreEnvironmentKey.self] = newValue
        }
    }
}
