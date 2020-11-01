import Foundation
import Data
import MovieListFlow
import Core

final class Dependencies {
    private let data: DataDependency
    let imageFetcher: ImageFetching = ImageFetcher()

    init() {
        data = DataDependency.build()
    }
}

extension Dependencies: MovieListFlowDependencing {
    var movieRepository: MovieRepositoring { return data.movieRepository }
}
