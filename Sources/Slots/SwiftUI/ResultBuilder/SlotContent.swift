import SwiftUI

public protocol SlotContent {
    associatedtype Body: SlotContent

    @SlotContentBuilder @MainActor var body: Body { get }
}

extension Never: SlotContent {}
