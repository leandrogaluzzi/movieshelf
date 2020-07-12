import Foundation
import CommonsUI

public final class MovieListCoordinator: Coordinator {
    override public var viewController: UIViewController? {
        let viewModel = MovieListViewModel()
        let viewController = ViewController(viewModel: viewModel)
        return viewController
    }
}
