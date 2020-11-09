import UIKit

public protocol ViewControllerRequest: EnvironmentRequest {
    associatedtype Input
    associatedtype EnvironmentResponse = CoordinatorProtocol
    var input: Input { get }
    
    func response<ViewController>(for viewController: ViewController.Type, environment: ViewController.Environment) -> UIViewController where ViewController: UIViewController,
                                                                                                                                           ViewController: Instantiatable,
                                                                                                                                           ViewController.Input == Input
}

extension ViewControllerRequest {
    public func response<ViewController>(for viewController: ViewController.Type, environment: ViewController.Environment) -> UIViewController where ViewController: UIViewController,
                                                                                                                                           ViewController: Instantiatable,
                                                                                                                                           ViewController.Input == Input {
        let vc = ViewController(input: input, environment: environment)
        return vc
    }
}
