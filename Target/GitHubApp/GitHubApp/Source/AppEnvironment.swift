import APIKit
import Core
import ComposableArchitecture
import SwiftyUserDefaults

final class AppEnvironment: AppEnvironmentProtocol {

    static let shared = AppEnvironment()
    let apiClient: APIClientProtocol
    var userDefaults: DefaultsAdapter<DefaultsKeys>
    let mainQueue: AnySchedulerOf<DispatchQueue>

    private init(apiClient: APIClientProtocol = APIClient(session: Session.shared),
                 userDefaults: DefaultsAdapter<DefaultsKeys> = Defaults,
                 mainQueue: AnySchedulerOf<DispatchQueue> = DispatchQueue.main.eraseToAnyScheduler()) {
        self.apiClient = apiClient
        self.userDefaults = userDefaults
        self.mainQueue = mainQueue
    }
}

