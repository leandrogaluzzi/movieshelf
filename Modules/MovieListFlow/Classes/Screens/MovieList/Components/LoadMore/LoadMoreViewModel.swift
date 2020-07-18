import Foundation
import CommonsUI
import Data
import RxSwift
import RxCocoa

protocol LoadMoreViewModelling: ViewModelling {
    var title: String { get }
    var isLoading: Driver<Bool> { get }
    var isHidden: Driver<Bool> { get }

    func loadMoreButtonPressed()
    func reset()
}

final class LoadMoreViewModel {
    private let movieRepository: MovieRepositoring
    private let pageVar = BehaviorRelay<Int>(value: 1)
    private let isLoadingVar = BehaviorRelay<Bool>(value: false)
    private let isHiddenVar = BehaviorRelay<Bool>(value: false)
    private let disposeBag = DisposeBag()

    init(movieRepository: MovieRepositoring = Injector.dependencies.movieRepository) {
        self.movieRepository = movieRepository
    }
}

extension LoadMoreViewModel: LoadMoreViewModelling {
    var modelledView: ModelledView { return LoadMoreView(viewModel: self) }

    var title: String { return "Load More" }

    var isLoading: Driver<Bool> { return isLoadingVar.asDriver() }
    var isHidden: Driver<Bool> {
        return movieRepository
            .observeIsNextPageAvailable()
            .map { !$0 }
            .asDriver(onErrorJustReturn: true)
    }

    func loadMoreButtonPressed() {
        isLoadingVar.accept(true)
        let newPage = pageVar.value + 1
        movieRepository
            .fetchMovieList(page: newPage)
            .do( onDispose: {
                self.isLoadingVar.accept(false)
                self.pageVar.accept(newPage)
            })
            .subscribe()
            .disposed(by: disposeBag)
    }

    func reset() {
        pageVar.accept(1)
    }
}
