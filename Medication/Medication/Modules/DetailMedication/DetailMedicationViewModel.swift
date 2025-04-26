//
//  DetailMedicationViewModel.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 26/04/2025.
//


import Foundation
import Combine

class DetailMedicationViewModel: ObservableObject {
    
    private let realmRepo: RealmDBRepository<MedicationRealm>
    let medicine: ConceptProperty
    
    @Published var message: String = ""
    
    init(realmRepo: RealmDBRepository<MedicationRealm>, medicine: ConceptProperty) {
        self.realmRepo = realmRepo
        self.medicine = medicine
    }
    
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
    

