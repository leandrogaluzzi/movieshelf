import Foundation
import CommonsUI

public final class MovieListCoordinator: Coordinator {
    override public func startFlow(animated: Bool) -> UIViewController {
        let viewModel = MovieListViewModel()
        let viewController = ViewController(viewModel: viewModel)
        return viewController
    }
}
