import Core
import UIKit
import SwiftUI

public final class DetailRepositoryCoordinator: CoordinatorProtocol {
    public typealias Input = DetailRespositoryCoordinatorRequest.Input
    
    private let navigationController: UINavigationController
    private let vc: UIViewController

    public init(input: Input, environment: AppEnvironmentProtocol) {
        self.navigationController = input.navigationController
        self.vc = environment.viewController(request: input.vcRequest)
    }
    
    public func start() {
        self.navigationController.pushViewController(vc, animated: false)
    }
}
