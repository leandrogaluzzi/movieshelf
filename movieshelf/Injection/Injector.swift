import Foundation
import MovieListFlow

final class Injector {
    private static var shared: Injector?

    static func load() {
        let dependencies = Dependencies()
        MovieListFlow.Injector.setup(with: dependencies)
    }
}
