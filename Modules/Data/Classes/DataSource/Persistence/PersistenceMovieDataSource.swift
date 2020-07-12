import Foundation
import RxSwift
import RxRealm

protocol PersistenceMovieDataSourcing {
    func observeMovieList() -> Observable<[Movie]>
    func persistMovieList(movies: [Movie]) -> Completable
}

final class PersistenceMovieDataSource: PersistenceDataSource, PersistenceMovieDataSourcing {
    func observeMovieList() -> Observable<[Movie]> {
        guard let realm = try? realm() else {
            return Observable.error(NSError(domain: "Realm init failure", code: 0, userInfo: nil))
        }

        return Observable
            .collection(from: realm.objects(DBMovie.self))
            .map { $0.toArray().map { $0.toModel() } }
    }

    func persistMovieList(movies: [Movie]) -> Completable {
        return persistObjects(objects: movies.map { DBMovie(movie: $0) })
    }
}
