import UIKit

public protocol ViewControllerProviderProtocol {
    func viewController<Request: ViewControllerRequest>(request: Request) -> UIViewController
}
