import UIKit

open class RootCoordinator: Coordinator {
    private unowned let window: UIWindow

    override open var mainViewController: UIViewController? { return nil }

    public init(window: UIWindow, coordinator: Coordinator) {
        self.window = window
        super.init()
        openChild(coordinator: coordinator, animated: false)
        window.rootViewController = coordinator.mainViewController
        window.makeKeyAndVisible()
    }

    @available(*, unavailable)
    override open func startFlow(animated: Bool) -> UIViewController { fatalError("Unavailable") }

    @available(*, unavailable)
    override open func closeFlow(animated: Bool, completion: (() -> Void)?) { fatalError("Unavailable") }
}
