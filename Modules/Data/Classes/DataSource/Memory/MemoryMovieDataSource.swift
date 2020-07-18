import Foundation
import RxSwift
import RxCocoa

protocol MemoryMovieDataSourcing {
    func observeMovieList() -> Observable<[Movie]>
    func saveMovieList(_ movieList: [Movie]) -> Completable
}

final class MemoryMovieDataSource: MemoryMovieDataSourcing {
    private let movieListVar = BehaviorRelay<[Movie]>(value: [])

    func observeMovieList() -> Observable<[Movie]> {
        return movieListVar
            .asObservable()
    }

    func saveMovieList(_ movieList: [Movie]) -> Completable {
        movieListVar.accept(movieList)
        return Completable.empty()
    }
}
