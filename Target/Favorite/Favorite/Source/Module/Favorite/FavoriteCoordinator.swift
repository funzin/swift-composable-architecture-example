import Core
import UIKit
import SwiftUI

public final class FavoriteCoordinator: CoordinatorProtocol {

    public typealias Input = FavoriteCoordinatorRequest.Input
    private let navigationController: UINavigationController
    private var detailRepositoryCoordinator: AnyCoordinator?
    
    private lazy var view: FavoriteView = {
        FavoriteView(store: .init(initialState: .init(),
                                  reducer: favoriteReducer,
                                  environment: environment),
                     didTapCell: { [weak self] repository in
                        guard let self = self else { return }
                        let request = DetailRespositoryCoordinatorRequest(input: .init(vcRequest: .init(input: .init(repository: repository)),
                                                                                       navigationController: self.navigationController))
                        let detailRepositoryCoordinator = self.environment.coordinator(request: request)
                        detailRepositoryCoordinator.start()
                        self.detailRepositoryCoordinator = detailRepositoryCoordinator
                     })
    }()
    public let environment: AppEnvironmentProtocol

    public init(input: Input, environment: AppEnvironmentProtocol) {
        self.navigationController = input.navigationController
        self.environment = environment
    }

    public func start() {
        let vc = UIHostingController(rootView: view)
        vc.title = L10n.favoriteViewTitle
        navigationController.pushViewController(vc, animated: true)
    }
}
