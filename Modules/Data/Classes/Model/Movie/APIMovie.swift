import Foundation

struct APIMovie: Decodable {
    let id: Int
    let title: String
    let overview: String
}

extension APIMovie {
    func toModel() -> Movie {
        return Movie(id: String(id), title: title, overview: overview)
    }
}
