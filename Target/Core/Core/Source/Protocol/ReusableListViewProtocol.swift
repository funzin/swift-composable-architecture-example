import UIKit

public protocol ReusableListViewProtocol where Cell: CellProtocol {
    associatedtype Cell
    func register(_ type: Cell.Type)
    func dequeueReusableCell(_ type: Cell.Type, indexPath: IndexPath) -> Cell
}

extension UICollectionView: ReusableListViewProtocol {
    public func register(_ type: UICollectionViewCell.Type) {
        self.register(type, forCellWithReuseIdentifier: type.className)
    }
    public func dequeueReusableCell(_ type: UICollectionViewCell.Type, indexPath: IndexPath) -> UICollectionViewCell {
        return self.dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath)
    }
}

extension UITableView: ReusableListViewProtocol {
    public func register(_ type: UITableViewCell.Type) {
        self.register(type, forCellReuseIdentifier: type.className)
    }
    public func dequeueReusableCell(_ type: UITableViewCell.Type, indexPath: IndexPath) -> UITableViewCell {
        return self.dequeueReusableCell(withIdentifier: type.className, for: indexPath)
    }
}
