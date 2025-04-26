//
//  RealmRepo.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 26/04/2025.
//

import Foundation
import RealmSwift

protocol IRealmDBRepository {
    associatedtype Entity: Object
    var realm: Realm { get }
    
    func getAll() -> Results<Entity>
    func create(_ entity: Entity) throws
    func delete(_ entity: Entity) throws
}

final class RealmDBRepository<T: Object>: IRealmDBRepository {
    
    typealias Entity = T
    
    internal var realm: Realm {
        do {
            return try Realm()
        } catch {
            fatalError("Failed to initialize Realm: \(error)")
        }
    }
    
    func getAll() -> Results<Entity> {
        return realm.objects(T.self)
    }
    func create(_ entity: Entity) throws {
        try realm.write {
            realm.add(entity, update: .modified)
        }
    }
    
    func delete(_ entity: Entity) throws {
        try realm.write {
            realm.delete(entity)
        }
    }
}
