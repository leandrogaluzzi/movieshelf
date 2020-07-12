import Foundation
import Data
import MovieListFlow

final class Dependencies {
    let data: DataDependency

    init() {
        data = DataDependency.build()
    }
}

extension Dependencies: MovieListFlowDependencing {
    var movieRepository: MovieRepositoring { return data.movieRepository }
}
