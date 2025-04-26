//
//  RealmRepo.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 26/04/2025.
//

import Foundation
import RealmSwift

/// A protocol defining the basic operations for a Realm database repository.
protocol IRealmDBRepository {
    associatedtype Entity: Object
    var realm: Realm { get }
    
    func getAll() -> Results<Entity>
    func create(_ entity: Entity) throws
    func delete(_ entity: Entity) throws
}

/// A generic repository class for performing CRUD operations on Realm objects.
final class RealmDBRepository<T: Object>: IRealmDBRepository {
    
    typealias Entity = T
    
    /// The Realm instance used for database operations.
    internal var realm: Realm {
        do {
            return try Realm()
        } catch {
            fatalError("Failed to initialize Realm: \(error)")
        }
    }
    
    /// Fetches all objects of type `T` from the Realm database.
    ///
    /// - Returns: A `Results<T>` containing all objects of type `T`.
    func getAll() -> Results<Entity> {
        return realm.objects(T.self)
    }
    
    /// Creates a new object of type `T` in the Realm database.
    ///
    /// - Parameter entity: The object to be added to the Realm database.
    /// - Throws: An error if the write transaction fails.
    func create(_ entity: Entity) throws {
        try realm.write {
            realm.add(entity, update: .modified)
        }
    }
    
    /// Deletes an existing object of type `T` from the Realm database.
    ///
    /// - Parameter entity: The object to be deleted from the Realm database.
    /// - Throws: An error if the write transaction fails.
    func delete(_ entity: Entity) throws {
        try realm.write {
            realm.delete(entity)
        }
    }
}
