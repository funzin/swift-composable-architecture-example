import SwiftUI
import Detail
import Mock
import Core
import Combine

struct DetailRepositoryViewControllerPreview: PreviewProvider {
    struct Wrapper: UIViewControllerRepresentable {
        
        func makeUIViewController(context: Self.Context) -> UIViewControllerType {
            return DetailRepositoryViewController(input: .init(repository: .mock(name: "name",
                                                                                 fullName: "fullName",
                                                                                 description: "description",
                                                                                 stargazersCount: 2000)),
                                                  environment: DetailAppEnvironment.shared)
        }
        
        func updateUIViewController(_ uiViewController: DetailRepositoryViewController, context: Context) {
        }
    }
    
    static var previews: some View {
        Wrapper()
    }
}
