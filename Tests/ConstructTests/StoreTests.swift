@testable import Construct
import SwiftUI
import Testing

@Suite struct StoreTests {
    @Test func initialize_empty() {
        let sut = Store.empty

        #expect(sut.count == 0)
    }

    @Test func appending_symbol_and_block() {
        let sut = Store.empty
            .appending(
                symbol: Symbol(Foo.self),
                block: Block { (foo: Foo) in
                    Text(verbatim: foo.parameter)
                }
            )

        #expect(sut.count == 1)
        #expect(sut[Foo.self] != nil)
        #expect(sut[Bar.self] == nil)

        #expect(sut[Foo.self]?(Foo(parameter: "foo")) != nil)
    }

    @Test func appending_item() {
        let original = Store.empty
        let sut = original.appending(
            item: ConstructItem(
                for: Foo.self,
                block: { foo in
                    Text(verbatim: foo.parameter)
                }
            )
        )

        #expect(original.count == 0)
        #expect(sut.count == 1)
    }

    @Test func appending_creates_new_instance() {
        let original = Store.empty
        let sut = original.appending { (foo: Foo) in
            Text(verbatim: foo.parameter)
        }

        #expect(original.count == 0)
        #expect(sut.count == 1)
    }

    @Test func merging() {
        let lhs = Store.empty.appending(item: .foo)
        let rhs = Store.empty.appending(item: .bar)

        let sut = lhs.merging(rhs)

        #expect(sut.count == 2)

        #expect(sut[Foo.self] != nil)
        #expect(sut[Bar.self] != nil)
    }

    @Test func joined() {
        let lhs = Store.empty.appending(item: .foo)
        let rhs = Store.empty.appending(item: .bar)

        let sut = [lhs, rhs].joined()

        #expect(sut.count == 2)

        #expect(sut[Foo.self] != nil)
        #expect(sut[Bar.self] != nil)
    }
}

private struct Foo {
    let parameter: String
}

private struct Bar {
    let parameter: String
}

private extension ConstructItem {
    static var foo: Self {
        .init(for: Foo.self) { foo in
            Text(verbatim: foo.parameter)
        }
    }

    static var bar: Self {
        .init(for: Bar.self) { bar in
            Text(verbatim: bar.parameter)
        }
    }
}
