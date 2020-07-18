import Foundation
import RxSwift
import RxCocoa

public protocol MovieRepositoring {
    func fetchMovieList() -> Completable
    func observeMovieList() -> Observable<[Movie]>
}

struct MovieRepository: MovieRepositoring {
    private let remote: RemoteMovieDataSourcing
    private let memory: MemoryMovieDataSourcing

    init(remote: RemoteMovieDataSourcing, memory: MemoryMovieDataSourcing) {
        self.remote = remote
        self.memory = memory
    }

    func fetchMovieList() -> Completable {
        return remote
            .fetchMovieList()
            .flatMapCompletable { self.memory.saveMovieList($0) }
    }

    func observeMovieList() -> Observable<[Movie]> {
        return memory
            .observeMovieList()
    }
}
