import APIKit

extension SessionTaskError: Equatable {
    public static func == (lhs: SessionTaskError, rhs: SessionTaskError) -> Bool {
        return lhs.localizedDescription == rhs.localizedDescription
    }
}
