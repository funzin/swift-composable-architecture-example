import Core
import UIKit
import SwiftUI

public final class SearchCoordinator: CoordinatorProtocol {
    public typealias Input = SearchCoordinatorRequest.Input

    private let navigationController: UINavigationController
    private lazy var view: SearchView = {
        SearchView(store: .init(initialState: .init(),
                                reducer: searchReducer,
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
    private var detailRepositoryCoordinator: AnyCoordinator?

    public init(input: Input, environment: AppEnvironmentProtocol) {
        self.navigationController = input.navigationController
        self.environment = environment
    }

    public func start() {
        let vc = UIHostingController(rootView: view)
        vc.title = L10n.searchViewTitle
        self.navigationController.pushViewController(vc, animated: true)
    }
}
