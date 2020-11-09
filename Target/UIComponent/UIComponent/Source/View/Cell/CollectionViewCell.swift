import UIKit
import Core

final class CollectionViewCell<View: ReusableViewProtocol>: UICollectionViewCell {
    private let view: View
    
    override init(frame: CGRect) {
        self.view = View()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        super.init(frame: frame)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func prepareForReuse() {
      view.prepareForReuse()
    }
    
    func configure(_configure: (View) -> Void) {
        _configure(view)
    }
}
