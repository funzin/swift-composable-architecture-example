import ComposableArchitecture
import Core
import SwiftUI
import UIComponent

public struct SearchView: View {
    let store: SearchStore
    var didTapCell: ((GitHubRepository) -> Void)?
    
    public init(store: SearchStore,
                didTapCell: ((GitHubRepository) -> Void)? = nil) {
        self.store = store
        self.didTapCell = didTapCell
    }
    
    public var body: some View {
        WithViewStore(self.store) { viewStore  in
            VStack {
                SearchBar(
                    text: viewStore.binding(
                        get: { $0.searchText },
                        send: { .searchKeyword($0) }
                    ),
                    placeholder: L10n.searchViewPlaceHolder
                )
                List(viewStore.repositories) { repository in
                    RepositoryItemView(repository: repository)
                        .onTapGesture {
                            self.didTapCell?(repository)
                        }
                }
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
                .alert(self.store.scope(state: { $0.alert }),
                       dismiss: .alertDismissed)
            }
        }
    }
}
