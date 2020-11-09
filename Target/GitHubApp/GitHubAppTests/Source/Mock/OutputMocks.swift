///
/// @Generated by Mockolo
///



import APIKit
@testable import GithubApp


public class SessionProtocolMock: SessionProtocol {
    public init() { }


    public private(set) var sendCallCount = 0
    public var sendHandler: ((Any, CallbackQueue?, Any) -> (SessionTask?))?
    public func send<Request: APIKit.Request>(_ request: Request, callbackQueue: CallbackQueue?, handler: @escaping (Result<Request.Response, SessionTaskError>) -> Void) -> SessionTask? {
        sendCallCount += 1
        if let sendHandler = sendHandler {
            return sendHandler(request, callbackQueue, handler)
        }
        return nil
    }
}
