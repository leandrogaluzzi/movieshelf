import UIKit

// MARK: - Palette

public struct ColorStylesheet {
    // swiftlint:disable discouraged_object_literal
    public static var clear = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
    public static var black = #colorLiteral(red: 0.1019607843, green: 0.1019607843, blue: 0.1019607843, alpha: 1)
    public static var white = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    // swiftlint:enable discouraged_object_literal

    public enum Color: CaseIterable {
        // Stylesheet greys
        case blue, emerald, red, orange, purple, pink, yellow, green

        public var light: UIColor {
            // swiftlint:disable discouraged_object_literal
            switch self {
            case .blue:
                return #colorLiteral(red: 0.8117647059, green: 0.8705882353, blue: 1, alpha: 1)
            case .emerald:
                return #colorLiteral(red: 0.8941176471, green: 0.9803921569, blue: 0.968627451, alpha: 1)
            case .red:
                return #colorLiteral(red: 0.9960784314, green: 0.8156862745, blue: 0.8156862745, alpha: 1)
            case .orange:
                return #colorLiteral(red: 0.9843137255, green: 0.8431372549, blue: 0.7568627451, alpha: 1)
            case .purple:
                return #colorLiteral(red: 0.5921568627, green: 0.5607843137, blue: 0.9254901961, alpha: 1)
            case .pink:
                return #colorLiteral(red: 1, green: 0.7882352941, blue: 0.8549019608, alpha: 1)
            case .yellow:
                return #colorLiteral(red: 0.9960784314, green: 0.8588235294, blue: 0.4784313725, alpha: 1)
            case .green:
                return #colorLiteral(red: 0.7725490196, green: 0.9647058824, blue: 0.8784313725, alpha: 1)
            }
            // swiftlint:enable discouraged_object_literal
        }

        public var normal: UIColor {
            // swiftlint:disable discouraged_object_literal
            switch self {
            case .blue:
                return #colorLiteral(red: 0.09803921569, green: 0.3058823529, blue: 0.7529411765, alpha: 1)
            case .emerald:
                return #colorLiteral(red: 0.04705882353, green: 0.8235294118, blue: 0.737254902, alpha: 1)
            case .red:
                return #colorLiteral(red: 0.9450980392, green: 0.3921568627, blue: 0.3921568627, alpha: 1)
            case .orange:
                return #colorLiteral(red: 1, green: 0.5607843137, blue: 0.2862745098, alpha: 1)
            case .purple:
                return #colorLiteral(red: 0.3411764706, green: 0.2862745098, blue: 0.6784313725, alpha: 1)
            case .pink:
                return #colorLiteral(red: 0.9843137255, green: 0.3764705882, blue: 0.5647058824, alpha: 1)
            case .yellow:
                return #colorLiteral(red: 1, green: 0.7843137255, blue: 0.1725490196, alpha: 1)
            case .green:
                return #colorLiteral(red: 0.1647058824, green: 0.7882352941, blue: 0.5058823529, alpha: 1)
            }
            // swiftlint:enable discouraged_object_literal
        }

        public var dark: UIColor {
            // swiftlint:disable discouraged_object_literal
            switch self {
            case .blue:
                return #colorLiteral(red: 0, green: 0.1882352941, blue: 0.5921568627, alpha: 1)
            case .emerald:
                return #colorLiteral(red: 0.01960784314, green: 0.5490196078, blue: 0.4705882353, alpha: 1)
            case .red:
                return #colorLiteral(red: 0.8, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            case .orange:
                return #colorLiteral(red: 0.8901960784, green: 0.3254901961, blue: 0, alpha: 1)
            case .purple:
                return #colorLiteral(red: 0.2078431373, green: 0.1607843137, blue: 0.4784313725, alpha: 1)
            case .pink:
                return #colorLiteral(red: 0.862745098, green: 0.2, blue: 0.4039215686, alpha: 1)
            case .yellow:
                return #colorLiteral(red: 0.9019607843, green: 0.6470588235, blue: 0.09019607843, alpha: 1)
            case .green:
                return #colorLiteral(red: 0.05882352941, green: 0.6588235294, blue: 0.3882352941, alpha: 1)
            }
            // swiftlint:enable discouraged_object_literal
        }
    }

    public enum Greyscale: CaseIterable {
        // Stylesheet greys
        case slate, smoke, snow

        public var light: UIColor {
            // swiftlint:disable discouraged_object_literal
            switch self {
            case .slate:
                return #colorLiteral(red: 0.4745098039, green: 0.5294117647, blue: 0.6156862745, alpha: 1)
            case .smoke:
                return #colorLiteral(red: 0.8509803922, green: 0.8862745098, blue: 0.9254901961, alpha: 1)
            case .snow:
                return #colorLiteral(red: 0.9764705882, green: 0.9803921569, blue: 0.9882352941, alpha: 1)
            }
            // swiftlint:enable discouraged_object_literal
        }

        public var normal: UIColor {
            // swiftlint:disable discouraged_object_literal
            switch self {
            case .slate:
                return #colorLiteral(red: 0.3294117647, green: 0.3607843137, blue: 0.4235294118, alpha: 1)
            case .smoke:
                return #colorLiteral(red: 0.7568627451, green: 0.8196078431, blue: 0.8745098039, alpha: 1)
            case .snow:
                return #colorLiteral(red: 0.937254902, green: 0.9490196078, blue: 0.968627451, alpha: 1)
            }
            // swiftlint:enable discouraged_object_literal
        }

        public var dark: UIColor {
            // swiftlint:disable discouraged_object_literal
            switch self {
            case .slate:
                return #colorLiteral(red: 0.1137254902, green: 0.1725490196, blue: 0.2352941176, alpha: 1)
            case .smoke:
                return #colorLiteral(red: 0.6705882353, green: 0.7254901961, blue: 0.7803921569, alpha: 1)
            case .snow:
                return #colorLiteral(red: 0.8980392157, green: 0.9215686275, blue: 0.9490196078, alpha: 1)
            }
            // swiftlint:enable discouraged_object_literal
        }
    }
}
