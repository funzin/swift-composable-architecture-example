import UIKit

public struct SearchCoordinatorRequest: CoordinatorRequest {
    public let input: Input

    public init(input: Input) {
        self.input = input
    }
}

extension SearchCoordinatorRequest {
    public struct Input {
        public let navigationController: UINavigationController

        public init(navigationController: UINavigationController) {
            self.navigationController = navigationController
        }
    }
}
