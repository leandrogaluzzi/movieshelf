import UIKit
import CommonsUI
import RxSwift
import RxCocoa

final class MovieDetailView: ModelledView {
    private let disposeBag = DisposeBag()

    private var viewModel: MovieDetailViewModelling { return vm as! MovieDetailViewModelling }

    override func setupView() {
        backgroundColor = UIColor.red
    }

    override func setupConstraints() {}

    override func bindRx() {}
}
