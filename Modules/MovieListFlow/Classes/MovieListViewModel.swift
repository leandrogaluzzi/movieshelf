import Foundation
import CommonsUI

protocol MovieListViewModelling: ViewModelling {}

final class MovieListViewModel {}

extension MovieListViewModel: MovieListViewModelling {
    var modelledView: ModelledView { MovieListView(viewModel: self) }
}
