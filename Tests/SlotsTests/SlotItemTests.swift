@testable import Slots
import SwiftUI
import Testing

@Suite struct SlotItemTests {
    @Test func initializer_missing_1() throws {
        let sut = SlotItem.missing { _ in }
        let (symbol, _) = try #require(sut.store.storage.first)

        #expect(symbol.name == "MissingSymbol")
    }

    @Test func initializer_missing_2() throws {
        let sut = SlotItem.missing {}
        let (symbol, _) = try #require(sut.store.storage.first)

        #expect(symbol.name == "MissingSymbol")
    }

    @Test func initializer_some_1() throws {
        let sut = SlotItem(for: SomeSymbol.self) { _ in }
        let (symbol, _) = try #require(sut.store.storage.first)

        #expect(symbol.name == "SomeSymbol")
    }

    @Test func initializer_some_2() throws {
        let sut = SlotItem(for: SomeSymbol.self) {}
        let (symbol, _) = try #require(sut.store.storage.first)

        #expect(symbol.name == "SomeSymbol")
    }
}

private enum SomeSymbol {}
