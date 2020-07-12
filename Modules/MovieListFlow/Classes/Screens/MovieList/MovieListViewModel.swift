import Foundation
import CommonsUI
import Data

protocol MovieListViewModelling: ViewModelling {}

final class MovieListViewModel {
//    private let movieRepository: MovieRepositoring
//
//    init(movieRepository: MovieRepositoring) {
//        self.movieRepository = movieRepository
//    }
}

extension MovieListViewModel: MovieListViewModelling {
    var modelledView: ModelledView { MovieListView(viewModel: self) }
}
