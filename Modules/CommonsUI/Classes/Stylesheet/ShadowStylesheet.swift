import Foundation

public enum ShadowStylesheet {
    case small, medium, large

    func shadow(backgroundColor: UIColor?, cornerRadius: CGFloat, bounds: CGRect) -> CAShapeLayer {
        switch self {
        case .small:
            return CAShapeLayer(backgroundColor: backgroundColor, cornerRadius: cornerRadius, bounds: bounds, alpha: 0.19, x: 0, y: 1, blur: 6)
        case .medium:
            return CAShapeLayer(backgroundColor: backgroundColor, cornerRadius: cornerRadius, bounds: bounds, alpha: 0.19, x: 0, y: 9, blur: 10)
        case .large:
            return CAShapeLayer(backgroundColor: backgroundColor, cornerRadius: cornerRadius, bounds: bounds, alpha: 0.13, x: 0, y: 0, blur: 23)
        }
    }
}

public extension UIView {
    @discardableResult
    func applyShadow(type: ShadowStylesheet) -> CAShapeLayer {
        let shadowLayer = type.shadow(backgroundColor: backgroundColor, cornerRadius: layer.cornerRadius, bounds: layer.bounds)
        layer.insertSublayer(shadowLayer, at: 0)
        return shadowLayer
    }
}

private extension CAShapeLayer {
    //https://stackoverflow.com/a/48489506

    convenience init(backgroundColor: UIColor?, cornerRadius: CGFloat, bounds: CGRect, color: UIColor = ColorStylesheet.Greyscale.slate.dark, alpha: Float = 0.5, x: CGFloat = 0, y: CGFloat = 2, blur: CGFloat = 4, spread: CGFloat = 0) {
        self.init()
        if let backgroundColor = backgroundColor {
            fillColor = backgroundColor.cgColor
        }

        path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowColor = color.cgColor
        shadowPath = path
        shadowOffset = CGSize(width: x, height: y)
        shadowOpacity = alpha
        shadowRadius = blur / 2.0
        shouldRasterize = true
        rasterizationScale = UIScreen.main.scale
    }
}
