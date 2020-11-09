import Mock
import Core
import Detail
import UIKit
import SwiftyUserDefaults
import ComposableArchitecture
import Combine

final class DetailAppEnvironment: AppEnvironmentProtocol {
    static let shared = DetailAppEnvironment()
    
    var apiClient: APIClientProtocol {
        return mockApiClient
    }
    let mockApiClient: MockAPIClient
    var userDefaults:  DefaultsAdapter<DefaultsKeys>
    let mainQueue: AnySchedulerOf<DispatchQueue>
    
    init(apiClient: MockAPIClient = MockAPIClient(),
         mainQueue: AnySchedulerOf<DispatchQueue> = DispatchQueue.main.eraseToAnyScheduler(),
         userDefaults: DefaultsAdapter<DefaultsKeys> = DefaultsAdapter<DefaultsKeys>(defaults: UserDefaults(suiteName: "mock")!, keyStore: .init())) {
        self.mockApiClient = apiClient
        self.userDefaults = userDefaults
        self.mainQueue = mainQueue
    }
    
    func coordinator<Request>(request: Request) -> AnyCoordinator where Request : CoordinatorRequest {
        fatalError("implement")
    }
    
    func viewController<Request>(request: Request) -> UIViewController where Request : ViewControllerRequest {
        switch request {
        case let request as DetailRepositoryViewControllerRequest:
            let vc = DetailRepositoryViewController(input: request.input,
                                                    environment: self)
            return vc
        default:
            fatalError("implement")
        }
    }
}
