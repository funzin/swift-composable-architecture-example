import APIKit
import Combine

/// @mockable
public protocol APIClientProtocol {
    func send<R: Request>(request: R) -> Future<R.Response, SessionTaskError>
}
