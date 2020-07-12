import Foundation
import RxSwift
import Moya

protocol RemoteMovieDataSourcing {
    func fetchMovieList() -> Single<[Movie]>
    func fetchGenres() -> Single<[Genre]>
}

class RemoteMovieDataSource: RemoteDataSource, RemoteMovieDataSourcing {
    func fetchMovieList() -> Single<[Movie]> {
        let response: Single<MovieListResponse> = request(target: MovieAPI.fetchMovieList)
        return response.map { $0.toModel() }
    }

    func fetchGenres() -> Single<[Genre]> {
        let response: Single<GenresResponse> = request(target: MovieAPI.fetchGenres)
        return response.map { $0.toModel() }
    }
}

private enum MovieAPI {
    case fetchMovieList
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
        return .requestParameters(parameters: ["api_key": Environment.apiKey], encoding: URLEncoding.queryString)
    }
}
