import APIKit
import ComposableArchitecture
import Core
import SwiftUI

public struct DetailRepositoryState: Equatable {
    let repository: GitHubRepository
    var isFavorite: Bool = false
    public init(repository: GitHubRepository) {
        self.repository = repository
    }
}

public enum DetailRepositoryAction: Equatable {
    case onAppear
    case didTapStarButton
}

public let detailReducer = Reducer<DetailRepositoryState, DetailRepositoryAction, AppEnvironmentProtocol> { state, action, environment in
    switch action {
    case .didTapStarButton:
        state.isFavorite.toggle()
        
        if state.isFavorite {
            let array = Array(Set(environment.userDefaults.repositories + [state.repository]))
            environment.userDefaults.repositories = array
        } else {
            let array = environment.userDefaults.repositories.filter { $0 != state.repository }
            environment.userDefaults.repositories = array
        }
        return .none
    case .onAppear:
        if environment.userDefaults.repositories.contains(state.repository) {
            state.isFavorite = true
        } else {
            state.isFavorite = false
        }
        return .none
    }
}

public typealias DetailRepositoryStore = Store<DetailRepositoryState, DetailRepositoryAction>
