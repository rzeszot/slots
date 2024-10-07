@testable import Construct
import Testing
import SwiftUI

@Suite
struct StoreTests {
    @Test
    func initialize_empty() {
        let sut = Store.empty

        #expect(sut.data.isEmpty)
    }

    @Test
    func test() {
        let sut = Store.empty.appending(Foo.self) { foo in
            Text(verbatim: foo.parameter)
        }

        #expect(sut.data.count == 1)
        #expect(sut.find(Foo.self) != nil)
        #expect(sut.find(Bar.self) == nil)

        #expect(sut.find(Foo.self)?(Foo(parameter: "foo")) != nil)
    }

}

private struct Foo {
    let parameter: String
}

private struct Bar {
    let parameter: String
}
