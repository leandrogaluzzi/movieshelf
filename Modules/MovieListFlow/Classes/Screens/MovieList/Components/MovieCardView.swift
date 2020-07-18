import Foundation
import CommonsUI
import RxSwift
import RxCocoa

final class MovieCardView: ModelledView {
    private struct Constraint {
        struct Label {
            static let edges: CGFloat = 16
        }
    }

    private let disposeBag = DisposeBag()

    private var viewModel: MovieCardViewModelling { return vm as! MovieCardViewModelling }

    private let labelTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        return label
    }()

    override func setupView() {
        backgroundColor = UIColor.black
        addSubview(labelTitle)
    }

    override func setupConstraints() {
        labelTitle.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Constraint.Label.edges)
        }
    }

    override func bindRx() {
        viewModel.title.drive(labelTitle.rx.text).disposed(by: disposeBag)
    }
}
