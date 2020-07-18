import Foundation
import RxSwift
import Moya

protocol RemoteMovieDataSourcing {
    func fetchMovieList(page: Int) -> Single<MovieList>
    func fetchGenres() -> Single<[Genre]>
}

class RemoteMovieDataSource: RemoteDataSource, RemoteMovieDataSourcing {
    func fetchMovieList(page: Int) -> Single<MovieList> {
        let response: Single<APIMovieList> = request(target: MovieAPI.fetchMovieList(page: page))
        return response.map { $0.toModel() }
    }

    func fetchGenres() -> Single<[Genre]> {
        let response: Single<GenresResponse> = request(target: MovieAPI.fetchGenres)
        return response.map { $0.toModel() }
    }
}

private enum MovieAPI {
    case fetchMovieList(page: Int)
    case fetchGenres
}

extension MovieAPI: TargetType {
    var path: String {
        switch self {
        case .fetchMovieList:
            return "/discover/movie"
        case .fetchGenres:
            return "/genre/movie/list"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        var parameters: [String: Any] = ["api_key": Environment.apiKey]
        switch self {
        case .fetchMovieList(let page):
            parameters["page"] = page
        case .fetchGenres:
            break
        }
        return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
    }
}
