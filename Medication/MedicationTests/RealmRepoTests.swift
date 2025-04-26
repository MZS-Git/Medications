import XCTest
import RealmSwift
@testable import Medication

class RealmRepoTests: XCTestCase {
    
    var repository: RealmDBRepository<MedicationRealm>!
    var realm: Realm!
    
    override func setUp() {
        super.setUp()
        
        // Set up a temporary Realm configuration for testing
        let config = Realm.Configuration(inMemoryIdentifier: "TestRealm")
        realm = try! Realm(configuration: config)
        
        // Instantiate the repository
        repository = RealmDBRepository<MedicationRealm>()
        
        // Clear any existing data before each test
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    override func tearDown() {
        // Clean up any changes after each test
        try! realm.write {
            realm.deleteAll()
        }
        super.tearDown()
    }
    
    func testDelete_whenEntityExists_entityDeleted() throws {
        // Test case for delete method
        
        let entity = MedicationRealm()
        entity.name = "Test Entity"
        entity.id = "26"
        
        // Add the entity
        try repository.create(entity)
        
        // Delete the entity
        try repository.delete(entity)
        
        let results = repository.getAll()
        
        // Assert that the entity is deleted
        XCTAssertEqual(results.count, 0, "Expected no objects in the Realm database after deletion.")
    }
}
