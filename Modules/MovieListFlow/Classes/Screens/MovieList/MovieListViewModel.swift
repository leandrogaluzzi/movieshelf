import Foundation
import CommonsUI
import Data
import RxSwift
import RxCocoa

protocol MovieListViewModelling: ViewModelling {
    var components: Driver<[ViewModelling]> { get }
}

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

    var components: Driver<[ViewModelling]> {
        return movieRepository
            .observeMovieList()
            .map { $0.map { $0.id }.map { MovieCardViewModel(id: $0) } }
            .asDriver(onErrorJustReturn: [])
    }
}
