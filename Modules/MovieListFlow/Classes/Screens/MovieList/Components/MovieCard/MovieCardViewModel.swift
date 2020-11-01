import Foundation
import Commons
import CommonsUI
import Data
import RxSwift
import RxCocoa
import Core

protocol MovieCardViewModelling: ViewModelling {
    var title: Driver<String?> { get }
    var overview: Driver<String?> { get }
    var poster: Driver<UIImage?> { get }

    func buttonOpenMovieDetailPressed()
}

final class MovieCardViewModel {
    private let id: String
    private unowned let navigation: MovieListNavigating
    private let movieRepository: MovieRepositoring
    private let imageFetcher: ImageFetching

    init(id: String,
         navigation: MovieListNavigating,
         movieRepository: MovieRepositoring = Injector.dependencies.movieRepository,
         imageFetcher: ImageFetching = Injector.dependencies.imageFetcher) {
        self.id = id
        self.navigation = navigation
        self.movieRepository = movieRepository
        self.imageFetcher = imageFetcher
    }

    var movieDriver: Driver<Movie?> {
        return movieRepository
            .observeMovie(id: self.id)
            .asDriver(onErrorJustReturn: nil)
    }
}

extension MovieCardViewModel: MovieCardViewModelling {
    var modelledView: ModelledView { return MovieCardView(viewModel: self) }

    var title: Driver<String?> { return movieDriver.map { $0?.title } }
    var overview: Driver<String?> { return movieDriver.map { $0?.overview } }

    var poster: Driver<UIImage?> {
        return movieDriver
            .map { $0?.poster?.toUrl }
            .flatMapLatest { self.imageFetcher.fetchImage(url: $0) }
            .asDriver(onErrorJustReturn: nil)
    }

    func buttonOpenMovieDetailPressed() {
        navigation.openMovieDetail(id: id)
    }
}
