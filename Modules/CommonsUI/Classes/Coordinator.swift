import Foundation

open class Coordinator: ClassNaming {
    public init() {}

    open func launchFlux(animated: Bool) -> UIViewController { preconditionFailure("error: '\(self.className)' does not override \(#function)") }
    open func closeFlux(animated: Bool, completion: (() -> Void)?) { preconditionFailure("error: '\(self.className)' does not override \(#function)") }
}
