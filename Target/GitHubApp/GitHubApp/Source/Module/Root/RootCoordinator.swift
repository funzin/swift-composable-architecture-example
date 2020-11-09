import Core
import SwiftUI
import UIKit

final class RootCoordinator: CoordinatorProtocol {
    typealias Input = RootCoordinatorRequest.Input
    private let window: UIWindow
    let environment: AppEnvironmentProtocol
    private var tabCoordinator: TabCoordinator?

    init(input: Input, environment: AppEnvironmentProtocol) {
        self.window = input.window
        self.environment = environment
    }
    
    func start() {
        let rootVC = UIViewController()
        window.rootViewController = rootVC
        let tabCoordinator = TabCoordinator(input: .init(rootVC: rootVC),
                                            environment: environment)
        tabCoordinator.start()
        window.makeKeyAndVisible()
        self.tabCoordinator = tabCoordinator
    }
}
