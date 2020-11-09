import Foundation
import Core

extension SearchRepositoriesResponse {
    public static func mock(totalCount: Int = 0,
                            incompleteResults: Bool = false,
                            items: [SearchRepositoriesItemResponse] = []) -> SearchRepositoriesResponse {
        return SearchRepositoriesResponse(totalCount: totalCount,
                                          incompleteResults: incompleteResults,
                                          items: items)
    }
}
