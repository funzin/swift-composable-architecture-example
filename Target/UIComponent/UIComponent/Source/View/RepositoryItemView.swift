import SwiftUI
import Core

public struct RepositoryItemView: View {
    private let repository: GitHubRepository

    public init(repository: GitHubRepository) {
        self.repository = repository
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "star")
                    .background(Color.black)
                    .cornerRadius(16)
                Text(repository.name).font(.subheadline)
            }
            Text(repository.fullName).font(.body)
            Text(repository.description)
            HStack {
                Image(systemName: "star")
                Text("\(repository.stargazersCount)")
            }
        }
    }
}
