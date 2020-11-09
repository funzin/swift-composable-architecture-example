import UIKit

public struct FavoriteCoordinatorRequest: CoordinatorRequest {
    public let input: Input

    public init(input: Input) {
        self.input = input
    }
}

extension FavoriteCoordinatorRequest {
    public struct Input {
        public let navigationController: UINavigationController

        public init(navigationController: UINavigationController) {
            self.navigationController = navigationController
        }
    }
}
