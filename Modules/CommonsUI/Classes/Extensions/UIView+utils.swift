import UIKit

public extension UIView {
    private struct Constraint {
        struct DampingAnimation {
            static let reducingRatioXY: CGFloat = 0.98
            static let reducingRatioZ: CGFloat = 1
            static let duration: Double = 0.3
            static let damping: CGFloat = 1
        }
    }

    static func animateWithDamping(delay: Double = 0, animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: Constraint.DampingAnimation.duration,
                       delay: delay,
                       usingSpringWithDamping: Constraint.DampingAnimation.damping,
                       initialSpringVelocity: 0,
                       options: .curveEaseOut,
                       animations: animations,
                       completion: completion)
    }
}
