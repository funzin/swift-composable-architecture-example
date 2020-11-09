import Foundation

public final class AnyCoordinator {
    private let _start: () -> Void
    
    public init<Coordinator: CoordinatorProtocol>(coordinator: Coordinator) {
        self._start = {
            coordinator.start()
        }
    }

    public func start() {
        _start()
    }
}
