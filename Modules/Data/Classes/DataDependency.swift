import Foundation

public struct DataDependency {
    public let movieRepository: MovieRepositoring

    private init() {
        movieRepository = MovieRepository(remote: RemoteMovieDataSource(), memory: MemoryMovieDataSource())
    }

    public static func build() -> DataDependency {
        return DataDependency()
    }
}
