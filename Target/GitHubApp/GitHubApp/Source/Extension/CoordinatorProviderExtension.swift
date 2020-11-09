import Core
import Search
import Favorite
import Detail

// MARK: CoordinatorProvider
extension AppEnvironment {
    func coordinator<Request>(request: Request) -> AnyCoordinator where Request : CoordinatorRequest {
        switch request {
        case let request as RootCoordinatorRequest:
            return AnyCoordinator(coordinator: RootCoordinator(input: request.input,
                                                               environment: self))
        case let request as TabCoordinatorRequest:
            return AnyCoordinator(coordinator: TabCoordinator(input: request.input,
                                                              environment: self))
        case let request as SearchCoordinatorRequest:
            return AnyCoordinator(coordinator: SearchCoordinator(input: request.input,
                                                                 environment: self))
        case let request as FavoriteCoordinatorRequest:
            return AnyCoordinator(coordinator: FavoriteCoordinator(input: request.input,
                                                                   environment: self))
        case let request as DetailRespositoryCoordinatorRequest:
            return AnyCoordinator(coordinator: DetailRepositoryCoordinator(input: request.input,
                                                                           environment: self))
        default:
            fatalError("should not reach here")
        }
    }
}
