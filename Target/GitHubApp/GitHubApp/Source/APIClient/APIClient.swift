import APIKit
import Core
import Combine

public final class APIClient: APIClientProtocol {
    public static let shared = APIClient(session: Session.shared)

    private let session: SessionProtocol
    public init(session: SessionProtocol) {
        self.session = session
    }

    public func send<R: Request>(request: R) -> Future<R.Response, SessionTaskError> {
        return Future { promise in
            _ = self.session.send(request) { result in
                switch result {
                case .success(let response):
                    promise(.success(response))
                case let .failure(error):
                    promise(.failure(error))
                }
            }
        }
    }
}
