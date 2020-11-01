import Foundation
import Data
import Core

public protocol MovieListFlowDependencing {
    var movieRepository: MovieRepositoring { get }
    var imageFetcher: ImageFetching { get }
}
