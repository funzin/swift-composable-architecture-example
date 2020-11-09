import Core
import Search
import Favorite
import Detail
import UIKit

// MARK: ViewControllerProviderExtension

extension AppEnvironment {
    func viewController<Request>(request: Request) -> UIViewController where Request : ViewControllerRequest {
        switch request {
        case let request as DetailRepositoryViewControllerRequest:
            return DetailRepositoryViewController(input: request.input,
                                                  environment: self)
        default:
            fatalError("implement")
        }
    }
}
