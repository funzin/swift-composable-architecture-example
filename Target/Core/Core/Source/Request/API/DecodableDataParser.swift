import APIKit

final class DecodableDataParser<T: Decodable>: DataParser {
    var contentType: String? { "application/json" }

    func parse(data: Data) throws -> Any {
        return try JSONDecoder().decode(T.self, from: data)
    }
}
