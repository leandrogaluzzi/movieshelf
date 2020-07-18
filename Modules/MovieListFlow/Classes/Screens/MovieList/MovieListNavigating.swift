import Foundation
import CommonsUI

protocol MovieListNavigating: Navigating {
    func openMovieDetail(id: String)
}

extension MovieListNavigating where Self: NavigationControllerCoordinator {
    func openMovieDetail(id: String) {
        let viewModel = MovieDetailViewModel()
        let viewController = ViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
