import Foundation

open class ViewController: UIViewController {
    public private(set) var vm: ViewModelling

    public init(viewModel: ViewModelling) {
        self.vm = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override open func loadView() {
        view = vm.modelledView
    }

    // Unavailable
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
