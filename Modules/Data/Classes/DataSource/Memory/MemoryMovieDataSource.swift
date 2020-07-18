import Foundation
import RxSwift
import RxCocoa

protocol MemoryMovieDataSourcing {
    func saveMovieList(_ movieList: MovieList) -> Completable
    func observeMovieList() -> Observable<[Movie]>
    func observeMovie(id: String) -> Observable<Movie?>
    func observeIsNextPageAvailable() -> Observable<Bool>
    func reset()
}

final class MemoryMovieDataSource: MemoryMovieDataSourcing {
    private let moviesVar = BehaviorRelay<[Movie]>(value: [])
    private let isNextPageAvailableVar = BehaviorRelay<Bool>(value: true)

    func saveMovieList(_ movieList: MovieList) -> Completable {
        var movies = moviesVar.value
        movies.append(contentsOf: movieList.movies)
        moviesVar.accept(movies)
        isNextPageAvailableVar.accept(movieList.isNextPageAvailable)
        return Completable.empty()
    }

    func observeMovieList() -> Observable<[Movie]> {
        return moviesVar
            .asObservable()
    }

    func observeMovie(id: String) -> Observable<Movie?> {
        return moviesVar
            .map { $0.first(where: { $0.id == id }) }
    }

    func observeIsNextPageAvailable() -> Observable<Bool> {
        return isNextPageAvailableVar
            .asObservable()
    }

    func reset() {
        moviesVar.accept([])
        isNextPageAvailableVar.accept(true)
    }
}
