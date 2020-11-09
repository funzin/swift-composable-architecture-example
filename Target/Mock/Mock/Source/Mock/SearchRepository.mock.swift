import Foundation
import Core

extension GitHubRepository {
    public static func mock(id: Int = 0,
                            name: String = "",
                            fullName: String = "",
                            htmlUrl: String = "",
                            description: String = "",
                            url: String = "",
                            stargazersCount: Int = 0) -> GitHubRepository {
        return GitHubRepository(id: id,
                                name: name,
                                fullName: fullName,
                                htmlUrl: htmlUrl,
                                description: description,
                                url: url,
                                stargazersCount: stargazersCount)
    }
}
