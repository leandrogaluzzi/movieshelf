import Foundation
import CommonsUI
import SnapKit
import RxSwift

final class MovieListView: ModelledView {
    private struct Constraint {
        struct Stack {
            static let spacing: CGFloat = 16
        }
    }

    private let disposeBag = DisposeBag()

    private var viewModel: MovieListViewModelling { return vm as! MovieListViewModelling }

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = Constraint.Stack.spacing
        return stack
    }()

    override func setupView() {
        backgroundColor = UIColor.lightGray
        addSubview(scrollView)
        scrollView.addSubview(stackView)
    }

    private func configureViews(content: [UIView]) {
        content.forEach { view in
            stackView.addArrangedSubview(view)
        }
    }

    override func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        stackView.snp.makeConstraints { make in
            make.top.bottom.centerX.width.equalToSuperview()
        }
    }

    override func bindRx() {
        viewModel
            .components
            .drive(onNext: { [weak self] viewModels in
                guard let self = self else { return }
                self.configureViews(content: viewModels.map { $0.modelledView })
            })
            .disposed(by: disposeBag)
    }
}
