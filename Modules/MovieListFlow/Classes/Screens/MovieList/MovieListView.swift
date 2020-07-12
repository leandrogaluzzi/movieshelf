import Foundation
import CommonsUI

final class MovieListView: ModelledView {
    private var viewModel: MovieListViewModelling { return vm as! MovieListViewModelling }

    override func setupView() {
        backgroundColor = UIColor.red
    }

    override func setupConstraints() {}

    override func bindRx() {}
}
