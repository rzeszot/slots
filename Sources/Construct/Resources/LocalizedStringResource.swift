import SwiftUI

extension LocalizedStringResource {
    private static func t(_ key: String.LocalizationValue) -> LocalizedStringResource {
        Self(key, table: "Error", bundle: .here)
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

private extension LocalizedStringResource.BundleDescription {
    final class Token {}

    static let here = Self.forClass(Token.self)
}

#Preview {
    Text(.error.fatal)
    Text(.error.cast(to: Int.self))
    Text(.error.missing(for: String.self))
}
