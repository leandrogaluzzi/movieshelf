import UIKit
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

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()

    private let labelTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.numberOfLines = 0
        return label
    }()

    private let labelOverview: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.numberOfLines = 0
        return label
    }()

    override func setupView() {
        addSubview(stackView)
        stackView.addArrangedSubview(labelTitle)
        stackView.addArrangedSubview(labelOverview)
    }

    override func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Constraint.Label.edges)
        }
    }

    override func bindRx() {
        viewModel.title.drive(labelTitle.rx.text).disposed(by: disposeBag)
        viewModel.overview.drive(labelOverview.rx.text).disposed(by: disposeBag)
    }
}
