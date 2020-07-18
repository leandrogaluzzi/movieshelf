import Foundation
import CommonsUI
import Data
import RxSwift
import RxCocoa

protocol MovieListViewModelling: ViewModelling {
    var loadMoreViewModel: LoadMoreViewModelling { get }
    var components: Driver<[ViewModelling]> { get }
    var isRefreshing: Driver<Bool> { get }
    var isLoading: Driver<Bool> { get }

    func startRefreshing()
}

final class MovieListViewModel {
    private let movieRepository: MovieRepositoring
    let loadMoreViewModel: LoadMoreViewModelling
    private let isRefreshingVar = BehaviorRelay<Bool>(value: false)
    private let isLoadingVar = BehaviorRelay<Bool>(value: true)
    private let disposeBag = DisposeBag()

    init(loadMoreViewModel: LoadMoreViewModelling = LoadMoreViewModel(),
         movieRepository: MovieRepositoring = Injector.dependencies.movieRepository) {
        self.loadMoreViewModel = loadMoreViewModel
        self.movieRepository = movieRepository
        fetchMovies()
    }

    private func fetchMovies() {
        movieRepository
            .fetchMovieList(page: 1)
            .do(onDispose: {
                self.isRefreshingVar.accept(false)
                self.isLoadingVar.accept(false)
            })
            .subscribe()
            .disposed(by: disposeBag)
    }
}

extension MovieListViewModel: MovieListViewModelling {
    var modelledView: ModelledView { MovieListView(viewModel: self) }

    var components: Driver<[ViewModelling]> {
        return movieRepository
            .observeMovieList()
            .map { $0.map { $0.id } }
            .map { $0.map { MovieCardViewModel(id: $0) } }
            .map { $0 + [self.loadMoreViewModel] }
            .asDriver(onErrorJustReturn: [])
    }

    var isRefreshing: Driver<Bool> { return isRefreshingVar.asDriver() }
    var isLoading: Driver<Bool> { return isLoadingVar.asDriver() }

    func startRefreshing() {
        isRefreshingVar.accept(true)
        movieRepository.reset()
        fetchMovies()
    }
}
