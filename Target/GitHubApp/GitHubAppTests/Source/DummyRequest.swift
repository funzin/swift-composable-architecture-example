import APIKit
import Foundation

struct DummyRequest: Request {
    typealias Response = String

    let baseURL = URL(string: "https://dummy.com")!
    let method: HTTPMethod = .get
    let path = "/path"

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try JSONDecoder().decode(Response.self, from: object as! Data)
    }
}
