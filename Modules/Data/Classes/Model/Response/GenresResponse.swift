import Foundation

struct GenresResponse: Decodable {
    let genres: [APIGenre]
}

extension GenresResponse {
    func toModel() -> [Genre] {
        return genres
            .map { $0.toModel() }
    }
}
