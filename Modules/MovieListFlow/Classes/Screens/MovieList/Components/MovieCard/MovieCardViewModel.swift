import Foundation
import CommonsUI
import Data
import RxSwift
import RxCocoa

protocol MovieCardViewModelling: ViewModelling {
    var title: Driver<String?> { get }
    var overview: Driver<String?> { get }

    func buttonOpenMovieDetailPressed()
}

final class MovieCardViewModel {
    private let id: String
    private unowned let navigation: MovieListNavigating
    private let movieRepository: MovieRepositoring

    init(id: String,
         navigation: MovieListNavigating,
         movieRepository: MovieRepositoring = Injector.dependencies.movieRepository) {
        self.id = id
        self.navigation = navigation
        self.movieRepository = movieRepository
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

    func buttonOpenMovieDetailPressed() {
        navigation.openMovieDetail(id: id)
    }
}
