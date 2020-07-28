import UIKit
import SnapKit

public final class CardView: UIView {
    private struct Constraint {
        struct HighlightAnimation {
            static let reducingRatioXY: CGFloat = 0.98
            static let reducingRatioZ: CGFloat = 1
        }
    }

    private var shadowLayer: CAShapeLayer?

    public var layerTransform: CATransform3D {
        get { super.layer.transform }
        set { super.layer.transform = newValue }
    }

    public init(cornerRadius: CGFloat) {
        super.init(frame: CGRect.zero)
        self.layer.cornerRadius = cornerRadius
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        shadowLayer?.removeFromSuperlayer()
        shadowLayer = applyShadow(type: .small)
    }

    public func insertAsBackground(_ view: UIView) {
        super.insertSubview(view, at: 0)
        view.layer.cornerRadius = super.layer.cornerRadius
        view.layer.masksToBounds = true
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension CardView {
    // Pressed animation
    func setPressed(_ pressed: Bool, animated: Bool) {
        let transform = pressed ? CATransform3DMakeScale(Constraint.HighlightAnimation.reducingRatioXY, Constraint.HighlightAnimation.reducingRatioXY, Constraint.HighlightAnimation.reducingRatioZ) : CATransform3DIdentity

        UIView.animateWithDamping(animations: { [weak self] in
            guard let self = self else { return }
            self.layerTransform = transform
            self.shadowLayer?.opacity = pressed ? 0.5 : 1
        })
    }
}
