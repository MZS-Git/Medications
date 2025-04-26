//
//  MedicationListViewModel.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 26/04/2025.
//

import Foundation
import Combine
import RealmSwift

/// A view model responsible for managing a list of medications.
///
/// `MedicationListViewModel` handles fetching and deleting medications from the local Realm database,
/// and provides feedback messages regarding the operations' outcomes.
class MedicationListViewModel: ObservableObject {
    
    /// A published property that holds the list of medications fetched from Realm.
    @Published var medications: Results<MedicationRealm>?
    
    /// A published property to display messages related to medication operations.
    @Published var message: String = "💊 No Medication Record yet"
    
    /// The repository responsible for performing CRUD operations on `MedicationRealm` objects.
    private let realmRepo: RealmDBRepository<MedicationRealm>
    
    /// Initializes the view model with a repository.
    ///
    /// - Parameter realmRepo: The repository for `MedicationRealm` objects.
    init(realmRepo: RealmDBRepository<MedicationRealm>) {
        self.realmRepo = realmRepo
    }
    
    /// Fetches all medications from the local Realm database and updates the `medications` property.
    func fetchMedications() {
        self.medications = realmRepo.getAll()
        
    }
    
    /// Deletes a medication at the specified index from the local Realm database.
    ///
    /// On success, the medication is removed from the database. On failure, an error message is set.
    ///
    /// - Parameter index: The index of the medication to be deleted in the `medications` list.
    func deleteMedication(index: Int) {
        if let meds = medications {
            let medicine = meds[index]
            do {
                try realmRepo.delete(medicine)
            } catch {
                self.message = "Failed to delete medicine: \(error.localizedDescription)"
            }
        }
    }
}
