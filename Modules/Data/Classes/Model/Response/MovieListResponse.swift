import Foundation

struct MovieListResponse: Decodable {
    let results: [APIMovie]
}

extension MovieListResponse {
    func toModel() -> [Movie] {
        return results
            .map { $0.toModel() }
    }
}
