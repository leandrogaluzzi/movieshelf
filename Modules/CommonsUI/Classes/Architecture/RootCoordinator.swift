import Foundation

open class RootCoordinator {
    private let window: UIWindow

    public init(coordinator: Coordinator) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = coordinator.viewController
        window.makeKeyAndVisible()
    }
}
