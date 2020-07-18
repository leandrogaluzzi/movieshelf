import Foundation
import CommonsUI
import Data
import RxSwift
import RxCocoa

protocol MovieCardViewModelling: ViewModelling {
    var title: Driver<String?> { get }
    var overview: Driver<String?> { get }
}

final class MovieCardViewModel {
    private let id: String
    private let movieRepository: MovieRepositoring

    init(id: String,
         movieRepository: MovieRepositoring = Injector.dependencies.movieRepository) {
        self.id = id
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
}
