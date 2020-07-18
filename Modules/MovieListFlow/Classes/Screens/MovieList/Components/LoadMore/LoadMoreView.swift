import UIKit
import CommonsUI
import RxSwift
import SnapKit

final class LoadMoreView: ModelledView {
    private struct Constraint {
        struct Button {
            static let edges: CGFloat = 16
            static let height: CGFloat = 50
        }
    }

    private let disposeBag = DisposeBag()

    private var viewModel: LoadMoreViewModelling { return vm as! LoadMoreViewModelling }

    private let buttonLoadMore = UIButton()

    override func setupView() {
        addSubview(buttonLoadMore)
    }

    override func setupConstraints() {
        buttonLoadMore.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Constraint.Button.edges)
            make.height.equalTo(Constraint.Button.height)
        }
    }

    override func bindRx() {
        buttonLoadMore.setTitle(viewModel.title, for: .normal)
        viewModel.isHidden.drive(rx.isHidden).disposed(by: disposeBag)

        buttonLoadMore
            .rx
            .tap
            .bind(onNext: viewModel.loadMoreButtonPressed)
            .disposed(by: disposeBag)
    }
}
