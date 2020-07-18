import Foundation

public extension UIStackView {
    private func remove(view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }

    func removeAllArrangedSubviews() {
        for subview in arrangedSubviews {
            remove(view: subview)
        }
    }

    func configureViews(_ views: [UIView]) {
        removeAllArrangedSubviews()
        views.forEach { addArrangedSubview($0) }
    }
}
