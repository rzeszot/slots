import Construct
import SwiftUI

struct TestView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Missing Value") {
                    MissingValueView()
                }
                NavigationLink("Present Value") {
                    PresentValueView()
                }
            }
            .navigationTitle("Tests")
        }
    }

    struct MissingValueView: View {
        struct MissingPlaceholder {
            let value: Int
        }

        var body: some View {
            VStack {
                ConstructView(for: MissingPlaceholder(value: 42))
            }
            .navigationTitle("Missing Value")
        }
    }

    struct PresentValueView: View {
        struct PresentPlaceholder {
            let value: Int
        }

        var body: some View {
            VStack {
                ConstructView(for: PresentPlaceholder(value: 42))
            }
            .construct(for: PresentPlaceholder.self) { placeholder in
                ZStack {
                    Color.yellow
                    Text("present \(placeholder.value) present")
                }
            }
            .navigationTitle("Present Value")
        }
    }
}

#Preview {
    TestView()
}
