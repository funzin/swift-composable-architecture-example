import Core
import Combine
import APIKit


public final class MockAPIClient: APIClientProtocol {
    public var sendHandler: ((Any) -> (Any))?
    public init() {}
    public private(set) var sendCallCount = 0
    
    public func send<R: Request>(request: R) -> Future<R.Response, SessionTaskError> {
        sendCallCount += 1
        if let sendHandler = sendHandler,
           let future = sendHandler(request) as? Future<R.Response, SessionTaskError> {
            return future
        }
        fatalError("sendHandler returns can't have a default value thus its handler must be set")
    }
}
