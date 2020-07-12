import Foundation
import RealmSwift

class DBMovie: Object {
    @objc dynamic var id = ""
    @objc dynamic var title = ""
    @objc dynamic var overview = ""

    convenience init(movie: Movie) {
        self.init()
        id = movie.id
        title = movie.title
        overview = movie.overview
    }

    override class func primaryKey() -> String? {
        return "id"
    }
}

extension DBMovie {
    func toModel() -> Movie {
        return Movie(id: id, title: title, overview: overview)
    }
}
