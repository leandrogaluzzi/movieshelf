import UIKit

public protocol NavigationControllerCoordinating {
    var navigationController: UINavigationController? { get }
}

open class NavigationControllerCoordinator: Coordinator, NavigationControllerCoordinating {
    open var navigationController: UINavigationController?
}
