import Foundation
import CommonsUI
import Data
import RxSwift
import RxCocoa

protocol MovieCardViewModelling: ViewModelling {
    var title: Driver<String?> { get }
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
        return Driver.just(nil)
//        movieRepository
//            .observeMovieList()
//            .filter { $0.first(where: { $0.id == self.id }) }
    }
}

extension MovieCardViewModel: MovieCardViewModelling {
    var modelledView: ModelledView { return MovieCardView(viewModel: self) }

    var title: Driver<String?> { return Driver.just("title") }
}
