import Foundation

public extension String {
    var toUrl: URL? {
        return URL(string: self)
    }
}
