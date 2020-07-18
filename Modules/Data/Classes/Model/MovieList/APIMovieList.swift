import Foundation

struct APIMovieList: Decodable {
    let page: Int
    let total_pages: Int
    let results: [APIMovie]
}

extension APIMovieList {
    func toModel() -> MovieList {
        return MovieList(movies: results
        .map { $0.toModel() }, isNextPageAvailable: page != total_pages)
    }
}
