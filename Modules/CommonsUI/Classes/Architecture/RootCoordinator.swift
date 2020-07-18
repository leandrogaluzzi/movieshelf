import Foundation

open class RootCoordinator {
    private let window: UIWindow
    private let coordinator: Coordinator

    public init(coordinator: Coordinator) {
        self.coordinator = coordinator
        window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = coordinator.viewController
        window.makeKeyAndVisible()
    }
}
