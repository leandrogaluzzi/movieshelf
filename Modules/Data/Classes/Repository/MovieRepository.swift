import Foundation
import RxSwift

public protocol MovieRepositoring {
    func fetchMovieList() -> Completable
    func observeMovieList() -> Observable<[Movie]>
}

struct MovieRepository: MovieRepositoring {
    private let remote: RemoteMovieDataSourcing
    private let persistance: PersistenceMovieDataSourcing

    init(remote: RemoteMovieDataSourcing, persistance: PersistenceMovieDataSourcing) {
        self.remote = remote
        self.persistance = persistance
    }

    func fetchMovieList() -> Completable {
        return remote
            .fetchMovieList()
            .flatMapCompletable { self.persistance.persistMovieList(movies: $0) }
    }

    func observeMovieList() -> Observable<[Movie]> {
        return persistance.observeMovieList()
    }
}
