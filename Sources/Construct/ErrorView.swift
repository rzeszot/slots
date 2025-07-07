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

#Preview {
    ErrorView(
        title: Text("Lorem ipsum"),
        message: Text("Dolor sit amet")
    )
}
