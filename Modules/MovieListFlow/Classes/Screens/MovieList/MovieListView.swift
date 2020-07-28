import Foundation
import CommonsUI
import SnapKit
import RxSwift

final class MovieListView: ModelledView {
    private struct Constraint {
        struct Stack {
            static let spacing: CGFloat = 0
        }
    }

    private let disposeBag = DisposeBag()

    private var viewModel: MovieListViewModelling { return vm as! MovieListViewModelling }

    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    private let refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        return refreshControl
    }()

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = Constraint.Stack.spacing
        return stack
    }()

    override func setupView() {
        backgroundColor = ColorStylesheet.Greyscale.snow.light
        addSubview(activityIndicator)
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        scrollView.refreshControl = refreshControl
    }

    override func setupConstraints() {
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        scrollView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
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
                self.stackView.configureViews(viewModels.map { $0.modelledView })
            })
            .disposed(by: disposeBag)

        refreshControl
            .rx
            .controlEvent(.valueChanged)
            .bind(onNext: viewModel.startRefreshing)
            .disposed(by: disposeBag)

        viewModel
            .isRefreshing
            .drive(refreshControl.rx.isRefreshing)
            .disposed(by: disposeBag)

        viewModel
            .isLoading
            .drive(activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)

        viewModel
            .isLoading
            .drive(scrollView.rx.isHidden)
            .disposed(by: disposeBag)
    }
}
