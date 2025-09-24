@testable import Construct
import SwiftUI
import Testing

@Suite @MainActor struct ConstructContentBuilderTests {
    @Test func example_1() {
        let sut = ConstructContentBuilder {
            ConstructItem(for: Foo.self) { foo in
                Text(String(describing: foo))
            }
            ConstructItem(for: Bar.self) { bar in
                Text(String(describing: bar))
            }
        }

        #expect(sut.store.count == 2)
        #expect(sut.store[Foo.self] != nil)
        #expect(sut.store[Bar.self] != nil)
        #expect(sut.store[Baz.self] == nil)
    }

    @Test func example_2() {
        let sut = ConstructContentBuilder {
            BazItem()
        }

        #expect(sut.store.count == 1)
        #expect(sut.store[Foo.self] == nil)
        #expect(sut.store[Bar.self] == nil)
        #expect(sut.store[Baz.self] != nil)
    }

    @Test func example_if_first() {
        let sut = ConstructContentBuilder {
            if true {
                FooItem()
            } else {
                BazItem()
            }
        }

        #expect(sut.store.count == 1)
        #expect(sut.store[Foo.self] != nil)
        #expect(sut.store[Bar.self] == nil)
        #expect(sut.store[Baz.self] == nil)
    }

    @Test func example_if_second() {
        let sut = ConstructContentBuilder {
            if false {
                FooItem()
            } else {
                BazItem()
            }
        }

        #expect(sut.store.count == 1)
        #expect(sut.store[Foo.self] == nil)
        #expect(sut.store[Bar.self] == nil)
        #expect(sut.store[Baz.self] != nil)
    }

    @Test func example_empty() {
        let sut = ConstructContentBuilder {

        }
        #expect(sut.store.count == 0)
    }
}

private enum Foo {
    case foo1
    case foo2
}

private enum Bar {
    case bar1
    case bar2
}

private enum Baz {
    case baz1
    case baz2
}

private struct FooItem: ConstructContent {
    var body: some ConstructContent {
        ConstructItem(for: Foo.self) { foo in
            Text(String(describing: foo))
        }
    }
}

private struct BazItem: ConstructContent {
    var body: some ConstructContent {
        ConstructItem(for: Baz.self) { baz in
            Text(String(describing: baz))
        }
    }
}
