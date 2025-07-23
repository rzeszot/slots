import SwiftUI

struct ErrorView: View {
    let title: Text
    let message: Text

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundStyle(.yellow)
                .font(.system(size: 32))

            Group {
                title
            }
            .font(.headline)

            Group {
                message
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
    static func fatal(message: Text) -> Self {
        ErrorView(
            title: Text(.error.fatal),
            message: message
        )
    }

    static func cast(to type: Any.Type) -> Self {
        .fatal(
            message: Text(.error.cast(to: type))
        )
    }

    static func missing(for type: Any.Type) -> Self {
        .fatal(
            message: Text(.error.missing(for: type))
        )
    }
}

#Preview {
    ErrorView.cast(to: Int.self)
}

#Preview {
    ErrorView.missing(for: Int.self)
}

#Preview {
    ErrorView(
        title: Text("Lorem ipsum"),
        message: Text("Dolor sit amet")
    )
}
