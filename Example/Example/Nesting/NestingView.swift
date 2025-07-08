import Construct
import SwiftUI

struct NestingPlaceholderAlpha: Hashable {}
struct NestingPlaceholderBeta: Hashable {}
struct NestingPlaceholderGamma: Hashable {}
struct NestingPlaceholderRoot: Hashable {}

enum Child: CaseIterable {
    case root
    case alpha
    case beta
    case gamma

    var color: Color {
        switch self {
        case .root: .green
        case .alpha: .yellow
        case .beta: .pink
        case .gamma: .teal
        }
    }

    var next: Child? {
        switch self {
        case .root: .alpha
        case .alpha: .beta
        case .beta: .gamma
        case .gamma: nil
        }
    }

    var defined: [Child] {
        let index = Self.allCases.firstIndex(of: self)!
        return Array(Self.allCases[0 ..< index + 1])
    }
}

struct NestingView: View {
    var body: some View {
        NavigationStack {
            subview(for: .root)
                .navigationDestination(for: Child.self) { child in
                    subview(for: child)
                }
        }
    }

    func subview(for child: Child) -> some View {
        ZStack {
            child.color
            VStack {
                Text("\(child)")

                if let next = child.next {
                    NavigationLink("\(next)", value: next)
                        .buttonStyle(.borderedProminent)
                }
                VStack {
                    ConstructView(for: NestingPlaceholderRoot())
                    ConstructView(for: NestingPlaceholderAlpha())
                    ConstructView(for: NestingPlaceholderBeta())
                    ConstructView(for: NestingPlaceholderGamma())
                }
                .if(child == .gamma) { view in
                    view
                        .construct(for: NestingPlaceholderGamma.self) {
                            Text(verbatim: "gamma override")
                        }
                }
                .if(child.defined.contains(.root)) { view in
                    view
                        .construct(for: NestingPlaceholderRoot.self) {
                            Text("root")
                        }
                }
                .if(child.defined.contains(.alpha)) { view in
                    view
                        .construct(for: NestingPlaceholderAlpha.self) {
                            Text("alpha")
                        }
                }
                .if(child.defined.contains(.beta)) { view in
                    view
                        .construct(for: NestingPlaceholderBeta.self) {
                            Text("beta")
                        }
                }
                .if(child.defined.contains(.gamma)) { view in
                    view
                        .construct(for: NestingPlaceholderGamma.self) {
                            Text("gamma")
                        }
                }
            }
        }
        .navigationTitle("\(child)")
    }
}

private extension View {
    @ViewBuilder
    func `if`(_ conditional: Bool, content: (Self) -> some View) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }
}
