import SwiftUI
import Search

@main
struct SearchSandboxApp: App {
    var body: some Scene {
        WindowGroup {
            SearchView.mock()
        }
    }
}
