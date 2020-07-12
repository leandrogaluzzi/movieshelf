import Foundation
import CommonsUI
import Data
import RxSwift

protocol MovieListViewModelling: ViewModelling {}

final class MovieListViewModel {
    private let movieRepository: MovieRepositoring
    private let disposeBag = DisposeBag()

    init(movieRepository: MovieRepositoring = Injector.dependencies.movieRepository) {
        self.movieRepository = movieRepository
        fetchMovies()
    }

    private func fetchMovies() {
        movieRepository
            .fetchMovieList()
            .subscribe()
            .disposed(by: disposeBag)
    }
}

extension MovieListViewModel: MovieListViewModelling {
    var modelledView: ModelledView { MovieListView(viewModel: self) }
}
