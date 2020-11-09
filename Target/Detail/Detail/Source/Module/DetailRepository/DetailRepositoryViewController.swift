import SwiftUI
import Core
import ComposableArchitecture
import Combine

public final class DetailRepositoryViewController: UIViewController, Instantiatable {
    private var cancellables: Set<AnyCancellable> = []
    
    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let starLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "star")
        return imageView
    }()
    
    private let starStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var starButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(didTapStarButton), for: .touchUpInside)
        return button
    }()
    
    private let viewStore: ViewStore<DetailRepositoryState, DetailRepositoryAction>
    
    public init(input: DetailRepositoryViewControllerRequest.Input, environment: AppEnvironmentProtocol) {
        self.viewStore = ViewStore(.init(initialState: .init(repository: input.repository),
                                         reducer: detailReducer,
                                         environment: environment))
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        starStackView.addArrangedSubview(starImageView)
        starStackView.addArrangedSubview(starLabel)
        
        containerStackView.addArrangedSubview(nameLabel)
        containerStackView.addArrangedSubview(fullNameLabel)
        containerStackView.addArrangedSubview(descriptionLabel)
        containerStackView.addArrangedSubview(starStackView)
        containerStackView.addArrangedSubview(starButton)
        containerStackView.addArrangedSubview(UIView())
        view.addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        self.viewStore.publisher
            .map { $0.repository }
            .sink(receiveCompletion: {_ in },
                  receiveValue: { [weak self] repository in
                    self?.nameLabel.text = repository.name
                    self?.fullNameLabel.text = repository.fullName
                    self?.descriptionLabel.text = repository.description
                    self?.starLabel.text = String(repository.stargazersCount)
                  })
            .store(in: &self.cancellables)
        
        self.viewStore.publisher
            .map { $0.isFavorite }
            .sink { [weak self] isFavorite in
                let title = isFavorite ? L10n.starred : L10n.star
                self?.starButton.setTitle(title, for: .normal)
            }
            .store(in: &self.cancellables)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewStore.send(.onAppear)
    }
    
    @objc func didTapStarButton() {
        viewStore.send(.didTapStarButton)
    }
}
