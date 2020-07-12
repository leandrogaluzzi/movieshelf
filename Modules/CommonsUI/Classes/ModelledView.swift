import UIKit

open class ModelledView: UIView {
    public unowned let vm: ViewModelling

    public init(viewModel: ViewModelling) {
        self.vm = viewModel
        super.init(frame: CGRect.zero)
        setup()
    }

    open func setup() {
        setupView()
        setupConstraints()
        bindRx()
    }

    open func setupView() {
        debugPrint("note: type '\(self.className))' does not override method \(#function).")
    }

    open func setupConstraints() {
        debugPrint("note: type '\(self.className))' does not override method \(#function)")
    }

    open func bindRx() {
        debugPrint("note: type '\(self.className))' does not override method \(#function)")
    }

    // Unavailable stuff

    @available(*, unavailable)
    override public init(frame: CGRect) { fatalError("init(frame:) has not been implemented") }
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
