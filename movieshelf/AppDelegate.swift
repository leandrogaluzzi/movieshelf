import UIKit
import CommonsUI
import MovieListFlow

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var coordinator: MovieListCoordinator?
}

extension AppDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setup()

        coordinator = MovieListCoordinator()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = coordinator?.mainViewController
        window?.makeKeyAndVisible()
        return true
    }
}

private extension AppDelegate {
    func setup() {
        Injector.load()
    }
}
