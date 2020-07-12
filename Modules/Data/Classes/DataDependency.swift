import Foundation

public struct DataDependency {
    public let movieRepository: MovieRepositoring

    private init() {
        movieRepository = MovieRepository()
    }

    public static func build() -> DataDependency {
        return DataDependency()
    }
}
