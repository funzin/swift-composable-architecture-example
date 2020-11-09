import UIKit

public protocol CoordinatorRequest: EnvironmentRequest {
    associatedtype Input
    associatedtype EnvironmentResponse = CoordinatorProtocol
    var input: Input { get }
    
    func response<Coordinator>(for coordinator: Coordinator.Type, environment: Coordinator.Environment) -> AnyCoordinator where Coordinator: CoordinatorProtocol,
                                                                                                                                             Coordinator.Input == Input
}

extension CoordinatorRequest {
    public func response<Coordinator>(for coordinator: Coordinator.Type, environment: Coordinator.Environment) -> AnyCoordinator where Coordinator: CoordinatorProtocol,
                                                                                                                                                    Coordinator.Input == Input {
        let coordinator = Coordinator(input: input, environment: environment)
        return AnyCoordinator(coordinator: coordinator)
    }
}
