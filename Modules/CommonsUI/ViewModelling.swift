import Foundation

public protocol ViewModelling: AnyObject {
    var modelledView: ModelledView { get }

    func didBecomeActive(firstTime: Bool)
    func didBecomeInactive()
}

public extension ViewModelling {
    func didBecomeActive(firstTime: Bool) {}

    func didBecomeInactive() {}
}
