import UIKit
import CommonsUI
import RxSwift
import RxCocoa

final class MovieCardView: ModelledView {
    private struct Constraint {
        struct CardView {
            static let cornerRadius: CGFloat = 8
            static let edges: CGFloat = 16
        }

        struct StackView {
            static let edges: CGFloat = 16
        }
    }

    private let disposeBag = DisposeBag()

    private var viewModel: MovieCardViewModelling { return vm as! MovieCardViewModelling }

    private let buttonOpenMovieDetail = UIButton()

    private let cardView: CardView = {
        let cardView = CardView(cornerRadius: Constraint.CardView.cornerRadius)
        cardView.backgroundColor = ColorStylesheet.white
        return cardView
    }()

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
        label.numberOfLines = 3
        return label
    }()

    override func setupView() {
        addSubview(cardView)
        addSubview(buttonOpenMovieDetail)
        cardView.addSubview(stackView)
        stackView.addArrangedSubview(labelTitle)
        stackView.addArrangedSubview(labelOverview)
    }

    override func setupConstraints() {
        buttonOpenMovieDetail.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        cardView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Constraint.CardView.edges)
        }

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Constraint.StackView.edges)
        }
    }

    override func bindRx() {
        viewModel.title.drive(labelTitle.rx.text).disposed(by: disposeBag)
        viewModel.overview.drive(labelOverview.rx.text).disposed(by: disposeBag)

        buttonOpenMovieDetail.rx.tap.bind(onNext: viewModel.buttonOpenMovieDetailPressed).disposed(by: disposeBag)
    }
}
