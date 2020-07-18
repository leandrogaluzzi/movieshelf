import Foundation
import RxSwift
import RxCocoa

public protocol MovieRepositoring {
    func fetchMovieList(page: Int) -> Completable
    func observeMovieList() -> Observable<[Movie]>
    func observeMovie(id: String) -> Observable<Movie?>
    func observeIsNextPageAvailable() -> Observable<Bool>
    func reset()
}

struct MovieRepository: MovieRepositoring {
    private let remote: RemoteMovieDataSourcing
    private let memory: MemoryMovieDataSourcing

    init(remote: RemoteMovieDataSourcing, memory: MemoryMovieDataSourcing) {
        self.remote = remote
        self.memory = memory
    }

    func fetchMovieList(page: Int) -> Completable {
        return remote
            .fetchMovieList(page: page)
            .flatMapCompletable { self.memory.saveMovieList($0) }
    }

    func observeMovieList() -> Observable<[Movie]> {
        return memory.observeMovieList()
    }

    func observeMovie(id: String) -> Observable<Movie?> {
        return memory.observeMovie(id: id)
    }

    func observeIsNextPageAvailable() -> Observable<Bool> {
        return memory.observeIsNextPageAvailable()
    }

    func reset() {
        return memory.reset()
    }
}
