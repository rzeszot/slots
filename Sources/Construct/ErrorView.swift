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
        .padding()
    }
}

nonisolated extension ErrorView {
    static func cast(to type: Any.Type) -> Self {
        ErrorView(
            title: Text("Fatal Error"),
            message: Text("Cannot cast to type: ") + Text("\(type)").bold()
        )
    }

    static func missing(for type: Any.Type) -> Self {
        ErrorView(
            title: Text("Fatal Error"),
            message: Text("No builder for symbol: ") + Text("\(type)").bold()
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
