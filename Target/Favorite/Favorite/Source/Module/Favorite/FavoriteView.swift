import ComposableArchitecture
import Core
import SwiftUI
import UIComponent

public struct FavoriteView: View {
    let store: FavoriteStore
    var didTapCell: ((GitHubRepository) -> Void)?

    public init(store: FavoriteStore,
                didTapCell: ((GitHubRepository) -> Void)? = nil) {
        self.store = store
        self.didTapCell = didTapCell
    }

    public var body: some View {
        WithViewStore(self.store) { viewStore  in

            List(viewStore.repositories) { repository in
                RepositoryItemView(repository: repository)
                    .onTapGesture {
                        self.didTapCell?(repository)
                    }
            }
            .onAppear {
                viewStore.send(.showRepositories)
            }
        }
    }
}

