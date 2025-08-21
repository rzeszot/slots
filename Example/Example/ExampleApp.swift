import SwiftUI

@main
struct ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            if ProcessInfo.processInfo.arguments.contains("--ui-tests") {
                TestView()
            } else {
                RootView()
            }
        }
    }
}
