import SwiftUI
import Core
import ComposableArchitecture

public struct DetailRepositoryView: View {
    private let store: DetailRepositoryStore

    public init(store: DetailRepositoryStore) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store) { viewStore in

            VStack(alignment: .leading, spacing: 8) {
                Text(viewStore.repository.name).font(.subheadline)
                Text(viewStore.repository.fullName).font(.body)
                Text(viewStore.repository.description)
                HStack {
                    Image(systemName: "star")
                    Text("\(viewStore.repository.stargazersCount)")
                }

                Button(viewStore.isFavorite ? L10n.starred: L10n.star) {
                    viewStore.send(.didTapStarButton)
                }
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
            .padding(16)
        }
    }
}
