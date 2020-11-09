import UIKit

public struct TabCoordinatorRequest: CoordinatorRequest {
    public let input: Input

    public init(input: Input) {
        self.input = input
    }
}

extension TabCoordinatorRequest {
    public struct Input {
        public let rootVC: UIViewController

        public init(rootVC: UIViewController) {
            self.rootVC = rootVC
        }
    }
}
