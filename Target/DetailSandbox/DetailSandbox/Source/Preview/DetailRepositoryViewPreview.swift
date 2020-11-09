import SwiftUI
import Detail
import Mock
import Core
import Combine

struct DetailRepositoryViewPreview: PreviewProvider {
    static var previews: some View {
        DetailRepositoryView.mock()
    }
}

extension DetailRepositoryView {
    static func mock() -> DetailRepositoryView {
        
        return DetailRepositoryView(store: .init(initialState: .init(repository: .mock(name: "name",
                                                                                       fullName: "fullName",
                                                                                       description: "description",
                                                                                       stargazersCount: 2000)),
                                                 reducer: detailReducer,
                                                 environment: MockAppEnvironment.shared))
        
    }
}

