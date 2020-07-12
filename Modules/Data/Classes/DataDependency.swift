import Foundation

public struct DataDependency {
    public let movieRepository: MovieRepositoring

    private init() {
        movieRepository = MovieRepository(remote: RemoteMovieDataSource(), persistance: PersistenceMovieDataSource())
    }

    public static func build() -> DataDependency {
        return DataDependency()
    }
}
