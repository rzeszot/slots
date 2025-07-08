@testable import Construct
import SwiftUI
import Testing

@Suite
struct StoreTests {
    @Test
    func initialize_empty() {
        let sut = Store.empty

        #expect(sut.data.count == 0)
    }

    @Test
    func find_returns_proper_object() {
        let sut = Store.empty.appending(Foo.self) { foo in
            Text(verbatim: foo.parameter)
        }

        #expect(sut.data.count == 1)
        #expect(sut.find(Foo.self) != nil)
        #expect(sut.find(Bar.self) == nil)

        #expect(sut.find(Foo.self)?(Foo(parameter: "foo")) != nil)
    }

    @Test
    func appending_creates_new_instance() {
        let original = Store.empty
        let sut = original.appending(Foo.self) { foo in
            Text(verbatim: foo.parameter)
        }

        #expect(original.data.count == 0)
        #expect(sut.data.count == 1)
    }
}

private struct Foo {
    let parameter: String
}

private struct Bar {
    let parameter: String
}
