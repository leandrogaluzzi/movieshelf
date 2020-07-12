import Foundation
import Moya
import RxSwift

class RemoteDataSource {
    func request<T: Decodable, R: TargetType>(target: R) -> Single<T> {
        return Single<T>.create { [weak self] callback in
            guard let self = self else { return Disposables.create() }
            let request = MoyaProvider<R>().request(target) { result in
                switch result {
                case .success(let response):
                    do {
                        let r = try response.map(T.self)
                        callback(.success(r))
                    } catch let error as Error {
                        callback(.error(error))
                    }
                case .failure(let error):
                    callback(.error(error))
                }
            }

            return Disposables.create {
                request.cancel()
            }
        }
    }
}

extension TargetType {
    var baseURL: URL { return URL(string: Environment.baseUrl)! }
    var headers: [String: String]? { return nil }
    var sampleData: Data { return Data() }
}
