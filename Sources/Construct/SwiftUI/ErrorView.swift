import SwiftUI

struct ErrorView: View {
    let title: LocalizedStringResource
    let message: LocalizedStringResource

    @Environment(\.locale)
    private var locale

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundStyle(.yellow)
                .font(.system(size: 32))

            Group {
                Text(title.locale(locale))
            }
            .font(.headline)

            Group {
                Text(message.locale(locale))
            }
            .font(.caption)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
        }
        .padding()
        .background(Color(.systemBackground))
    }
}

nonisolated extension ErrorView {
    static func fatal(message: LocalizedStringResource) -> Self {
        ErrorView(
            title: .error.fatal,
            message: message
        )
    }

    static func cast(to type: Any.Type) -> Self {
        .fatal(
            message: .error.cast(to: type)
        )
    }

    static func missing(for type: Any.Type) -> Self {
        .fatal(
            message: .error.missing(for: type)
        )
    }
}

#Preview {
    ErrorView.fatal(message: "previews")
        .environment(\.locale, Locale(identifier: "pl"))
}

#Preview {
    ErrorView.fatal(message: "previews")
        .environment(\.locale, Locale(identifier: "en"))
}
