import Core
import SwiftUI
import UIKit

final class TabCoordinator: CoordinatorProtocol {
    typealias Input = TabCoordinatorRequest.Input
    private let rootVC: UIViewController
    let environment: AppEnvironmentProtocol
    private var searchCoordinator: AnyCoordinator?
    private var favoriteCoordinator: AnyCoordinator?
    
    init(input: Input, environment: AppEnvironmentProtocol) {
        self.rootVC = input.rootVC
        self.environment = environment
    }
    
    func start() {
        let tabBarController = TabViewController()
        rootVC.addChild(tabBarController)
        tabBarController.view.frame = rootVC.view.frame
        rootVC.view.addSubview(tabBarController.view)
        tabBarController.didMove(toParent: rootVC)
        
        let searchNavigationVC = UINavigationController()
        searchNavigationVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let searchCoordinator = environment.coordinator(request: SearchCoordinatorRequest(input: .init(navigationController: searchNavigationVC)))
        
        let favoriteNavigationVC = UINavigationController()
        favoriteNavigationVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        let favoriteCoordinator = environment.coordinator(request: FavoriteCoordinatorRequest(input: .init(navigationController: favoriteNavigationVC)))
        
        tabBarController.viewControllers = [
            searchNavigationVC,
            favoriteNavigationVC
        ]
        
        searchCoordinator.start()
        favoriteCoordinator.start()
        self.searchCoordinator = searchCoordinator
        self.favoriteCoordinator = favoriteCoordinator
    }
}
