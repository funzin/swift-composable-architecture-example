import APIKit

/// @mockable
public protocol SessionProtocol {
    func send<Request: APIKit.Request>(_ request: Request,
                                       callbackQueue: CallbackQueue?,
                                       handler: @escaping (Result<Request.Response, SessionTaskError>) -> Void) -> SessionTask?
}

extension Session: SessionProtocol {}

extension SessionProtocol {
    func send<Request: APIKit.Request>(_ request: Request,
                                       callbackQueue: CallbackQueue? = nil,
                                       handler: @escaping (Result<Request.Response, SessionTaskError>) -> Void = { _ in }) -> SessionTask? {
        return send(request, callbackQueue: callbackQueue, handler: handler)
    }
}
