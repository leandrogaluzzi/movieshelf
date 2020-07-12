import UIKit
import CommonsUI
import MovieListFlow

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var appCoordinator: Coordinator?
}

extension AppDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setup()
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            appCoordinator = RootCoordinator(window: window, coordinator: MovieListCoordinator())
        }
        return true
    }
}

private extension AppDelegate {
    func setup() {
        Injector.load()
    }
}
