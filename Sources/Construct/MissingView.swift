import SwiftUI

struct MissingView: View {
    let type: Any.Type

    var title: Text {
        Text("Missing View Builder")
    }

    var message: Text {
        Text("No view builder found for type: ")
        + Text(String(describing: type))
            .fontWeight(.bold)
    }

    var body: some View {
        ErrorView(title: title, message: message)
    }
}

#Preview {
    MissingView(type: Int.self)
}

#Preview {
    MissingView(type: String.self)
}
