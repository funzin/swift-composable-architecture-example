import UIKit
import Core
import ComposableArchitecture
import SwiftyUserDefaults

open class MockAppEnvironment: AppEnvironmentProtocol {

    public static let shared = MockAppEnvironment()
    
    public var apiClient: APIClientProtocol {
        return mockApiClient
    }
    public let mockApiClient: MockAPIClient
    public var userDefaults:  DefaultsAdapter<DefaultsKeys>
    public let mainQueue: AnySchedulerOf<DispatchQueue>

    public init(apiClient: MockAPIClient = MockAPIClient(),
                mainQueue: AnySchedulerOf<DispatchQueue> = DispatchQueue.main.eraseToAnyScheduler(),
                userDefaults: DefaultsAdapter<DefaultsKeys> = DefaultsAdapter<DefaultsKeys>(defaults: UserDefaults(suiteName: "mock")!, keyStore: .init())) {
        self.mockApiClient = apiClient
        self.userDefaults = userDefaults
        self.mainQueue = mainQueue
    }

    open func coordinator<Request>(request: Request) -> AnyCoordinator where Request : CoordinatorRequest {
        fatalError("implement")
    }
    
    open func viewController<Request>(request: Request) -> UIViewController where Request : ViewControllerRequest {
        fatalError("implement")
    }
}
