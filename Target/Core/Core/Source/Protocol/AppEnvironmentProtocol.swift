import Foundation
import ComposableArchitecture
import SwiftyUserDefaults

public protocol AppEnvironmentProtocol: class,
                                        CoordinatorProviderProtocol,
                                        ViewControllerProviderProtocol {
    var apiClient: APIClientProtocol { get }
    var userDefaults: DefaultsAdapter<DefaultsKeys> { get set }
    var mainQueue: AnySchedulerOf<DispatchQueue> { get }
}
