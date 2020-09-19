import Foundation
import Kingfisher
import RxSwift

public protocol ImageFetching {
    func fetchImage(url: URL?) -> Observable<UIImage?>
    func fetchImage(url: URL?, placeholder: UIImage?) -> Observable<UIImage?>
}

public class ImageFetcher: ImageFetching {
    public init() {}

    public func fetchImage(url: URL?) -> Observable<UIImage?> {
        return fetchImage(url: url, placeholder: nil)
    }

    public func fetchImage(url: URL?, placeholder: UIImage?) -> Observable<UIImage?> {
        guard let url = url else { return Observable.just(placeholder) }
        return KingfisherManager.shared.fetchImage(url: url, placeholder: placeholder)
    }
}

private extension KingfisherManager {
    func fetchImage(url: URL, placeholder: UIImage?) -> Observable<UIImage?> {
        return Observable<UIImage?>.create { [weak self] callback in
            guard let self = self else { return Disposables.create() }

            if let placeholder = placeholder {
                callback.on(.next(placeholder))
            }

            self.retrieveImage(with: ImageResource(downloadURL: url)) { result in
                switch result {
                case let .success(imageResult):
                    callback.on(.next(imageResult.image))
                    callback.onCompleted()
                case let .failure(error):
                    if placeholder == nil {
                        callback.on(.error(error))
                    }
                    callback.onCompleted()
                }
            }

            return Disposables.create()
        }
    }
}
