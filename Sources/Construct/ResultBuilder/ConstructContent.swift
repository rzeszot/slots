import SwiftUI

public protocol ConstructContent {
    associatedtype Body: ConstructContent

    @ConstructContentBuilder @MainActor var body: Body { get }
}

extension Never: ConstructContent {}
