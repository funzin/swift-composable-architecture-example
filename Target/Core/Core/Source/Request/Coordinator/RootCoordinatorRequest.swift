import UIKit

public struct RootCoordinatorRequest: CoordinatorRequest {
    public let input: Input

    public init(input: Input) {
        self.input = input
    }
}

extension RootCoordinatorRequest {
    public struct Input {
        public let window: UIWindow

        public init(window: UIWindow) {
            self.window = window
        }
    }
}
