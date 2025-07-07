import SwiftUI

struct MissingView: View {
    let type: Any.Type

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundStyle(.yellow)
                .font(.system(size: 32))

            Text("Missing View Builder")
                .font(.headline)
            VStack {
                Text("No view builder found for type:")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                Text(String(describing: type))
                    .font(.caption.bold())
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .padding()
    }
}

#Preview {
    MissingView(type: Int.self)
}
