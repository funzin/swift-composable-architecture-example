import Foundation

public protocol CoordinatorProviderProtocol {
    func coordinator<Request: CoordinatorRequest>(request: Request) -> AnyCoordinator
}
