import Foundation
import CommonsUI

public final class MovieListCoordinator {
    public init() {}

    public lazy var mainViewController: UIViewController? = {
        let viewModel = MovieListViewModel(navigation: self)
        let viewController = ViewController(viewModel: viewModel)
        viewController.title = "Movie Shelves App"
        return UINavigationController(rootViewController: viewController)
    }()
}

extension MovieListCoordinator: MovieListNavigating {}
