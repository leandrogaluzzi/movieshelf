import Foundation

open class Coordinator: ClassNaming {
    private var child: Coordinator?

    public weak var parent: Coordinator?

    public init() {}

    open private(set) var mainViewController: UIViewController?

    open func startFlow(animated: Bool) -> UIViewController { preconditionFailure("error: '\(self.className)' does not override \(#function)") }
    open func closeFlow(animated: Bool, completion: (() -> Void)?) { preconditionFailure("error: '\(self.className)' does not override \(#function)") }
}

public extension Coordinator {
    func openChild(coordinator: Coordinator, animated: Bool, closeChildAnimated: Bool = false) {
        let presentBlock = {
            self.child = coordinator
            coordinator.parent = self
            let viewController = coordinator.startFlow(animated: animated)
            coordinator.mainViewController = viewController
            coordinator.present(viewController: viewController, animated: animated)
        }

        if let child = child {
            child.closeCoordinator(animated: closeChildAnimated, completion: presentBlock)
        } else {
            presentBlock()
        }
    }

    func closeCoordinator(animated: Bool, completion: (() -> Void)?) {
        let dismiss: () -> Void = {
            self.closeFlow(animated: animated) {
                self.parent?.coordinatorDidClose()
                completion?()
            }
        }

        if let child = child {
            child.closeCoordinator(animated: animated, completion: dismiss)
        } else {
            dismiss()
        }
    }

    func present(viewController: UIViewController, animated: Bool) {
        // swiftlint:disable:next present_view_controller
        parent?.mainViewController?.present(viewController, animated: animated, completion: nil)
    }

    func dismissViewController(animated: Bool, completion: (() -> Void)?) {
        if let viewControllerForDismissing = mainViewController {
            viewControllerForDismissing.dismissWithPresented(animated: animated, completion: completion)
        } else {
            completion?()
        }
    }
}

private extension Coordinator {
    func coordinatorDidClose() {
        child = nil
    }
}

private extension UIViewController {
    func dismissWithPresented(animated: Bool, completion: (() -> Void)?) {
        guard presentingViewController != nil else {
            completion?()
            return
        }
        dismissAllPresented { [weak self] in
            guard let self = self else { return }
            // swiftlint:disable:next dismiss_view_controller
            self.dismiss(animated: animated, completion: completion)
        }
    }

    func dismissAllPresented(_ completion: (() -> Void)?) {
        guard let presented = presentedViewController else {
            completion?()
            return
        }
        presented.dismissAllPresented {
            // swiftlint:disable:next dismiss_view_controller
            presented.dismiss(animated: false, completion: completion)
        }
    }
}
