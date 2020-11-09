import APIKit
import Foundation

extension Request {
    public var baseURL: URL { URL(string: "https://api.github.com")! }

    // set github token
    public var headerFields: [String: String] {
        ["Authorization": "token $GITHUB_TOKEN"]
    }
}

extension Request where Response: Decodable {

    public var dataParser: APIKit.DataParser {
        return DecodableDataParser<Response>()
    }

    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let entity = object as? Response else {
            throw ResponseError.unexpectedObject(object)
        }
        return entity
    }
}
