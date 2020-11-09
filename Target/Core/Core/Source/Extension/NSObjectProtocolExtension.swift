import Foundation

extension NSObjectProtocol {
    public var className: String {
        String(describing: type(of: self))
    }
    
    public static var className: String {
        String(describing: self)
    }
}


