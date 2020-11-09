import UIKit

public protocol ReusableViewProtocol where Self: UIView {
    func prepareForReuse()
}
