import SwiftUI

extension LocalizedStringResource {
    private static func t(_ key: String.LocalizationValue) -> LocalizedStringResource {
        Self(key, table: "Error", bundle: .module)
    }

    enum error {
        static let fatal: LocalizedStringResource = .t("fatal")

        static func cast(to type: Any.Type) -> LocalizedStringResource {
            .t("cast \(String(describing: type))")
        }

        static func missing(for type: Any.Type) -> LocalizedStringResource {
            .t("missing \(String(describing: type))")
        }
    }
}

#Preview {
    Text(.error.fatal)
    Text(.error.cast(to: Int.self))
    Text(.error.missing(for: String.self))
}
