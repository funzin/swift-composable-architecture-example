import UIKit

public struct DetailRespositoryCoordinatorRequest: CoordinatorRequest {
    public let input: Input

    public init(input: Input) {
        self.input = input
    }
}

extension DetailRespositoryCoordinatorRequest {
    public struct Input {
        public let vcRequest: DetailRepositoryViewControllerRequest
        public let navigationController: UINavigationController

        public init(vcRequest: DetailRepositoryViewControllerRequest,
                    navigationController: UINavigationController) {
            self.vcRequest = vcRequest
            self.navigationController = navigationController
        }
    }
}
