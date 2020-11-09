import Core
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            self.window = window
            let rootVC = UINavigationController(rootViewController: DetailTableViewController())
            window.rootViewController = rootVC
            window.makeKeyAndVisible()
        }
    }
}

