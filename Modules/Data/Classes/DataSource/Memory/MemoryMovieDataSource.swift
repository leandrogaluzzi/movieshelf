import Foundation
import RxSwift
import RxCocoa

protocol MemoryMovieDataSourcing {
    func saveMovieList(_ movieList: [Movie]) -> Completable
    func observeMovieList() -> Observable<[Movie]>
    func observeMovie(id: String) -> Observable<Movie?>
}

final class MemoryMovieDataSource: MemoryMovieDataSourcing {
    private let movieListVar = BehaviorRelay<[Movie]>(value: [])

    func saveMovieList(_ movieList: [Movie]) -> Completable {
        movieListVar.accept(movieList)
        return Completable.empty()
    }

    func observeMovieList() -> Observable<[Movie]> {
        return movieListVar
            .asObservable()
    }

    func observeMovie(id: String) -> Observable<Movie?> {
        return movieListVar
            .map { $0.first(where: { $0.id == id }) }
    }
}
