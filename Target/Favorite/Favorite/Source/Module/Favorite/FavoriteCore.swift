import APIKit
import ComposableArchitecture
import Core
import SwiftUI

public struct FavoriteState: Equatable {
    var repositories: [GitHubRepository] = []

    public init() {}
}

public enum FavoriteAction: Equatable {
    case showRepositories
}

public let favoriteReducer = Reducer<FavoriteState, FavoriteAction, AppEnvironmentProtocol> { state, action, environment in
    switch action {
    case .showRepositories:
        state.repositories = environment.userDefaults.repositories
        return .none
    }
}

public typealias FavoriteStore = Store<FavoriteState, FavoriteAction>
