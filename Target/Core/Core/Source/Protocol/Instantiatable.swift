import Foundation

public protocol Instantiatable {
    associatedtype Input
    associatedtype Environment
    init(input: Input, environment: Environment)
}

public extension Instantiatable {
    static func instantiate(input: Input, environment: Environment) -> Self {
        return Self(input: input, environment: environment)
    }
}

public extension Instantiatable where Input == Void {
    static func instantiate(environment: Environment) -> Self {
        return Self(input: (), environment: environment)
    }
}
