import SwiftUI
import Favorite

@main
struct FavoriteSandBoxApp: App {
    var body: some Scene {
        WindowGroup {
            FavoriteView.mock()
        }
    }
}
