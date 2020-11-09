import XCTest
import APIKit

@testable import APIClient
class APIClientTests: XCTestCase {

    var apiClient: APIClient!
    var session: SessionProtocolMock!

    override func setUpWithError() throws {
        self.session = SessionProtocolMock()
        self.apiClient = APIClient(session: session)
    }

    func test_send_when_success() {
        let result: Result<DummyRequest.Response, SessionTaskError> = .success("success")

        session.sendHandler = { _, _, handler -> SessionTask? in
            guard let handler = handler as? (Result<DummyRequest.Response, SessionTaskError>) -> Void else {
                XCTFail("should not reach here")
                return nil
            }
            handler(result)
            return nil
        }

        _ = apiClient.send(request: DummyRequest()).sink(receiveCompletion: { completion in
            switch completion {
            case .failure:
                XCTFail("should not reach here")
            case .finished:
                break
            }
        }, receiveValue: { response in
            XCTAssertEqual(response, "success")
        })

        XCTAssertEqual(session.sendCallCount, 1)
    }

    func test_send_when_failure() {
        let result: Result<DummyRequest.Response, SessionTaskError> = .failure(SessionTaskError.connectionError(DummyError.dummy))

        session.sendHandler = { _, _, handler -> SessionTask? in
            guard let handler = handler as? (Result<DummyRequest.Response, SessionTaskError>) -> Void else {
                XCTFail("should not reach here")
                return nil
            }
            handler(result)
            return nil
        }

        _ = apiClient.send(request: DummyRequest()).sink(receiveCompletion: { completion in
            switch completion {
            case let .failure(error):
                guard case let .connectionError(dummyError) = error as? SessionTaskError else {
                    XCTFail("error should be connectionError but it is \(error)")
                    return
                }
                XCTAssertTrue(dummyError is DummyError)
            case .finished:
                break
            }
        }, receiveValue: { response in
            XCTFail("should not reach here")
        })

        XCTAssertEqual(session.sendCallCount, 1)
    }
}
