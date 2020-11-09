import APIKit
import ComposableArchitecture
import Core
import SwiftUI

public struct SearchState: Equatable {
    var searchText: String = ""
    var repositories: [GitHubRepository] = []
    var alert: AlertState<SearchAction>?

    public init() {}
}

public enum SearchAction: Equatable {
    case searchKeyword(String)
    case GitHubRepositoryResponse(Result<SearchRepositoriesRequest.Response, SessionTaskError>)
    case alertDismissed
}

struct SearchRequestToken: Hashable {}

public let searchReducer = Reducer<SearchState, SearchAction, AppEnvironmentProtocol> { state, action, environment in
    switch action {
    case let .searchKeyword(keyword):
        state.searchText = keyword
        guard !keyword.isEmpty else {
            return Effect(value: SearchAction.GitHubRepositoryResponse(.success(.init(totalCount: nil,
                                                                                      incompleteResults: nil,
                                                                                      items: nil))))
        }
        return environment.apiClient.send(request: SearchRepositoriesRequest(query: keyword))
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .map(SearchAction.GitHubRepositoryResponse)
            .cancellable(id: SearchRequestToken())

    case let .GitHubRepositoryResponse(.success(response)):
        state.repositories = response.items?.map(GitHubRepository.init) ?? []
        return .none
    case let .GitHubRepositoryResponse(.failure(error)):
        state.alert = .init(title: LocalizedStringKey(error.localizedDescription))
        return .none
    case .alertDismissed:
        state.alert = nil
        return .none
    }
}

public typealias SearchStore = Store<SearchState, SearchAction>
