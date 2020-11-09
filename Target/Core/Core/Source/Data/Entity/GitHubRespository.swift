import Foundation
import SwiftyUserDefaults

public struct GitHubRepository: Equatable, Identifiable, Hashable, Codable, DefaultsSerializable {
    public let id: Int
    public let name: String
    public let fullName: String
    public let htmlUrl: String
    public let description: String
    public let url: String
    public let stargazersCount: Int

    public init(id: Int, name: String, fullName: String, htmlUrl: String, description: String, url: String, stargazersCount: Int) {
        self.id = id
        self.name = name
        self.fullName = fullName
        self.htmlUrl = htmlUrl
        self.description = description
        self.url = url
        self.stargazersCount = stargazersCount
    }

    public init(response: SearchRepositoriesItemResponse) {
        self.id = response.id
        self.name = response.name
        self.fullName = response.fullName
        self.htmlUrl = response.htmlUrl
        self.description = response.description ?? ""
        self.url = response.url
        self.stargazersCount = response.stargazersCount ?? 0
    }
}
