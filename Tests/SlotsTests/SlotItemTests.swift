@testable import Slots
import SwiftUI
import Testing

@Suite struct SlotItemTests {
    @Test func initializer_missing_1() {
        let sut = SlotItem.missing { _ in }
        #expect(sut.symbol.name == "MissingSymbol")
    }

    @Test func initializer_missing_2() {
        let sut = SlotItem.missing {}
        #expect(sut.symbol.name == "MissingSymbol")
    }

    // MARK: -
    @Test func initializer_some_1() {
        let sut = SlotItem(for: SomeSymbol.self) { _ in }
        #expect(sut.symbol.name == "SomeSymbol")
    }

    @Test func initializer_some_2() {
        let sut = SlotItem(for: SomeSymbol.self) {}
        #expect(sut.symbol.name == "SomeSymbol")
    }
}

private enum SomeSymbol {}
