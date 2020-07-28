import Foundation
import CommonsUI

protocol MovieListNavigating: Navigating {
    func openMovieDetail(id: String)
}

extension MovieListNavigating where Self: MovieListCoordinator {
    func openMovieDetail(id: String) {
        let viewModel = MovieDetailViewModel()
        let viewController = ViewController(viewModel: viewModel)
        // swiftlint:disable:next present_view_controller
        mainViewController?.present(viewController, animated: true)
    }
}
