import UIKit
import CommonsUI
import MovieListFlow

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var rootCoordinator: RootCoordinator?
}

extension AppDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setup()
        rootCoordinator = RootCoordinator(coordinator: MovieListCoordinator())
        return true
    }
}

private extension AppDelegate {
    func setup() {
        Injector.load()
    }
}
