import Foundation

struct APIGenre: Decodable {
    let id: Int
    let name: String
}

extension APIGenre {
    func toModel() -> Genre {
        return Genre(id: String(id), name: name)
    }
}
