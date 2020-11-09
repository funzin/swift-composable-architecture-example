import APIKit

public struct SearchRepositoriesRequest: Request {
    public typealias Response = SearchRepositoriesResponse

    public let method: HTTPMethod = .get
    public let path = "/search/repositories"
    public var queryParameters: [String: Any]? = [:]

    public init(query: String) {
        self.queryParameters?["q"] = query
    }
}

public struct SearchRepositoriesResponse: Equatable, Codable {
    public let totalCount: Int?
    public let incompleteResults: Bool?
    public let items: [SearchRepositoriesItemResponse]?

    public init(totalCount: Int?, incompleteResults: Bool?, items: [SearchRepositoriesItemResponse]?) {
        self.totalCount = totalCount
        self.incompleteResults = incompleteResults
        self.items = items
    }

    private enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

public struct SearchRepositoriesItemResponse: Equatable, Codable {
    public let id: Int
    public let nodeId: String
    public let name: String
    public let fullName: String
    public let htmlUrl: String
    public let description: String?
    public let url: String
    public let createdAt: String
    public let updatedAt: String
    public let stargazersCount: Int?

    public init(id: Int, nodeId: String, name: String, fullName: String, htmlUrl: String, description: String?, url: String, createdAt: String, updatedAt: String, stargazersCount: Int) {
        self.id = id
        self.nodeId = nodeId
        self.name = name
        self.fullName = fullName
        self.htmlUrl = htmlUrl
        self.description = description
        self.url = url
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.stargazersCount = stargazersCount
    }


    private enum CodingKeys: String, CodingKey {
        case id
        case nodeId = "node_id"
        case name
        case fullName = "full_name"
        case htmlUrl = "html_url"
        case description
        case url
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case stargazersCount = "stargazers_count"
    }
}
