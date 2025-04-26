//
//  MedicationListViewModelTests.swift
//  MedicationTests
//
//  Created by Muhammad Zain Shahid on 26/04/2025.
//

import XCTest
import RealmSwift
@testable import Medication

class MedicationListViewModelTests: XCTestCase {
    
    var viewModel: MedicationListViewModel!
    var realmRepo: RealmDBRepository<MedicationRealm>!
    var realm: Realm!
    
    override func setUp() {
        super.setUp()
        
        // Set up an in-memory Realm for testing
        let config = Realm.Configuration(inMemoryIdentifier: "TestRealm")
        realm = try! Realm(configuration: config)
        
        // Set up the repository
        realmRepo = RealmDBRepository<MedicationRealm>()
        
        // Instantiate the view model with the repository
        viewModel = MedicationListViewModel(realmRepo: realmRepo)
        
        // Clear any existing data before each test
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    override func tearDown() {
        // Clean up after each test
        try! realm.write {
            realm.deleteAll()
        }
        super.tearDown()
    }
    
    func testDeleteMedication_whenNotExists_showsErrorMessage() {
        // Test case for deleteMedication method when attempting to delete a non-existing medication
        
        // Fetch medications when empty
        viewModel.fetchMedications()
        
        // Try deleting from an empty list (invalid index)
        viewModel.deleteMedication(index: 0)
        
        // Assert the message contains an error
        XCTAssertTrue(viewModel.message.contains("Failed to delete medicine"), "Expected error message for failed delete.")
    }
}

