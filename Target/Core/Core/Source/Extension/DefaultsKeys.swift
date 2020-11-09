import SwiftyUserDefaults

extension DefaultsKeys {
    public var repositories: DefaultsKey<[GitHubRepository]> { .init("repositories", defaultValue: []) }
}
