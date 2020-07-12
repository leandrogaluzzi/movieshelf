import Foundation

public protocol ClassNaming {
    var className: String { get }
}

public extension ClassNaming {
    var className: String { return String(describing: type(of: self)) }
    static var className: String { return String(describing: self) }
}

extension NSObject: ClassNaming {}
