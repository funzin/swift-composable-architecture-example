import SwiftUI
import Favorite
import Mock
import Core
import Combine

struct FavoriteViewPreview: PreviewProvider {
    static var previews: some View {
        FavoriteView.mock()
    }
}

extension FavoriteView {
    static func mock() -> FavoriteView {
        FavoriteAppEnvironment.shared.userDefaults.repositories = (0..<10).map { _ in GitHubRepository.mock(name: "name",
                                                                                                            fullName: "fullName",
                                                                                                            description: "description") }
        return FavoriteView(store: .init(initialState: .init(),
                                         reducer: favoriteReducer,
                                         environment: FavoriteAppEnvironment.shared))
    }
}

