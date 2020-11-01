import Foundation

struct APIMovie: Decodable {
    let id: Int
    let title: String
    let overview: String
    let poster_path: String?
    let backdrop_path: String?
}

extension APIMovie {
    func toModel() -> Movie {
        return Movie(id: String(id), title: title, overview: overview, poster: poster_path, backdrop: backdrop_path)
    }
}
