import UIKit

public struct DetailRepositoryViewControllerRequest: ViewControllerRequest {
    public let input: Input

    public init(input: Input) {
        self.input = input
    }
}

extension DetailRepositoryViewControllerRequest {
    public struct Input {
        public let repository: GitHubRepository

        public init(repository: GitHubRepository) {
            self.repository = repository
        }
    }
}
