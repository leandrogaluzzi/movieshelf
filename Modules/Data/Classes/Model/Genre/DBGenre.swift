import Foundation
import RealmSwift

class DBGenre: Object {
    @objc dynamic var id = ""
    @objc dynamic var name = ""

    convenience init(genre: Genre) {
        self.init()
        id = genre.id
        name = genre.name
    }

    override class func primaryKey() -> String? {
        return "id"
    }
}

extension DBGenre {
    func toModel() -> Genre {
        return Genre(id: id, name: name)
    }
}
