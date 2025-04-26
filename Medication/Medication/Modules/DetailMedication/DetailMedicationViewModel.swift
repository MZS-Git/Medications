//
//  DetailMedicationViewModel.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 26/04/2025.
//


import Foundation
import Combine

/// A view model responsible for managing the details of a medication.
///
/// `DetailMedicationViewModel` handles the addition of a medication to the local Realm database
/// and provides feedback messages regarding the operation's success or failure.
class DetailMedicationViewModel: ObservableObject {
    
    /// The repository responsible for performing CRUD operations on `MedicationRealm` objects.
    private let realmRepo: RealmDBRepository<MedicationRealm>
    
    /// The medication concept to be managed.
    let medicine: ConceptProperty
    
    /// A published property to display messages related to medication operations.
    @Published var message: String = ""
    
    /// Initializes the view model with a repository and a medication concept.
    ///
    /// - Parameters:
    ///   - realmRepo: The repository for `MedicationRealm` objects.
    ///   - medicine: The medication concept to be managed.
    init(realmRepo: RealmDBRepository<MedicationRealm>, medicine: ConceptProperty) {
        self.realmRepo = realmRepo
        self.medicine = medicine
    }
    
    /// Adds the current medication to the local Realm database.
    ///
    /// On success, the medication is stored locally. On failure, an error message is set.
    func addToMedicationList() {
        do {
            let medication = MedicationRealm()
            medication.name = medicine.name
            medication.id = medicine.rxcui
            try realmRepo.create(medication)
        } catch {
            self.message = "Failed to add medicine: \(error.localizedDescription)"
        }
    }
}


