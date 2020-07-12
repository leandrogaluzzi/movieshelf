import Foundation

public final class Injector {
    private static var shared: Injector?

    class var dependencies: MovieListFlowDependencing {
        if let injector = shared {
            return injector.dependencies
        } else {
            fatalError("Please set the Config for \(Bundle(for: Injector.self))")
        }
    }

    private let dependencies: MovieListFlowDependencing

    private init(dependencies: MovieListFlowDependencing) {
        self.dependencies = dependencies
    }

    public class func setup(with dependencies: MovieListFlowDependencing) {
        Injector.shared = Injector(dependencies: dependencies)
    }
}
