import Foundation
import CommonsUI

public final class MovieListCoordinator: NavigationControllerCoordinator {
    override public var viewController: UIViewController? {
        let viewModel = MovieListViewModel(navigation: self)
        let viewController = ViewController(viewModel: viewModel)
        viewController.title = "Movie Shelves App"
        let navigationController = UINavigationController(rootViewController: viewController)
        self.navigationController = navigationController
        return navigationController
    }
}

extension MovieListCoordinator: MovieListNavigating {}
