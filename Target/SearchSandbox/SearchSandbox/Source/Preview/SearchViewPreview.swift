import APIKit
import SwiftUI
import Search
import Mock
import Core
import Combine

struct SearchViewPreview: PreviewProvider {
    static var previews: some View {
        SearchView.mock()
    }
}

extension SearchView {
    static func mock() -> SearchView {
        
        SearchAppEnvironment.shared.mockApiClient.sendHandler = { _ in
            return Future<SearchRepositoriesRequest.Response, SessionTaskError> { promise in
                return promise(.success(.mock(items: (0..<Int.random(in: 1..<10)).map { _ in .mock(name: "name",
                                                                                                   fullName: "fullName",
                                                                                                   description: "description",
                                                                                                   stargazersCount: 100)
                })))
            }
        }
        return SearchView(store: .init(initialState: .init(),
                                       reducer: searchReducer,
                                       environment: SearchAppEnvironment.shared))
        
    }
}

