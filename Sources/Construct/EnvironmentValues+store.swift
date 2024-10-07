import SwiftUI

extension EnvironmentValues {
    private struct StoreKey: EnvironmentKey {
        static var defaultValue: Store {
            [:]
        }
    }

    var store: Store {
        get {
            self[StoreKey.self]
        }
        set {
            self[StoreKey.self] = newValue
        }
    }
}
