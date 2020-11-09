import Core
import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {


    private var rootCoordinator: AnyCoordinator?
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            self.window = window

            let rootCoordinator = AppEnvironment.shared.coordinator(request: RootCoordinatorRequest(input: .init(window: window)))
            rootCoordinator.start()
            self.rootCoordinator = rootCoordinator
        }
    }
}

