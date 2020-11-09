import Foundation
import Core

extension SearchRepositoriesItemResponse {

        public static func mock(id: Int = 0,
                                nodeId: String = "",
                                name: String = "",
                                fullName: String = "",
                                htmlUrl: String = "",
                                description: String = "",
                                url: String = "",
                                createdAt: String = "",
                                updatedAt: String = "",
                                stargazersCount: Int = 0) -> SearchRepositoriesItemResponse {
            return SearchRepositoriesItemResponse(id: id,
                                                  nodeId: nodeId,
                                                  name: name,
                                                  fullName: fullName,
                                                  htmlUrl: htmlUrl,
                                                  description: description,
                                                  url: url,
                                                  createdAt: createdAt,
                                                  updatedAt: updatedAt,
                                                  stargazersCount: stargazersCount)
    }
}
