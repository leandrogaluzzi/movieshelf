import Foundation
import RxSwift
import RealmSwift

protocol PersistenceDataSourcing {
    func deleteAllObjects() -> Completable
}

class PersistenceDataSource: PersistenceDataSourcing {
    func realm() throws -> Realm {
        let configuration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        let realm = try Realm(configuration: configuration)
        return realm
    }

    func persistObjects(objects: [Object]) -> Completable {
        return Completable.create { callback in
            do {
                let db = try self.realm()
                try db.write { db.add(objects, update: .modified) }
                callback(.completed)
            } catch let error as Error {
                callback(.error(error))
            }

            return Disposables.create()
        }
    }

    func persistObject(object: Object) -> Completable {
        return Completable.create { callback in
            do {
                let db = try self.realm()
                try db.write { db.add(object, update: .modified) }
                callback(.completed)
            } catch let error as Error {
                callback(.error(error))
            }

            return Disposables.create()
        }
    }

    func deleteObjects<Element: Object>(of type: Element.Type) -> Completable {
        return Completable.create { callback in
            do {
                let db = try self.realm()
                let objects = db.objects(type.self)
                try db.write { db.delete(objects) }
                callback(.completed)
            } catch let error as Error {
                callback(.error(error))
            }

            return Disposables.create()
        }
    }

    func deleteAllObjects() -> Completable {
        return Completable.create { callback in
            do {
                let db = try self.realm()
                try db.write { db.deleteAll() }
                callback(.completed)
            } catch let error as Error {
                callback(.error(error))
            }

            return Disposables.create()
        }
    }
}
