//
//  MedicationListViewModel.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 26/04/2025.
//

import Foundation
import Combine

class MedicationListViewModel: ObservableObject {
    
    @Published var medications: [MedicationRealm] = []
    @Published var message: String = "💊 No Medication Record yet"
    
    private let realmRepo: RealmDBRepository<MedicationRealm>
    
    init(realmRepo: RealmDBRepository<MedicationRealm>) {
        self.realmRepo = realmRepo
    }
    
    func fetchMedications() {
        let result = realmRepo.getAll()
        medications = Array(result)
    }
    
    func deleteMedication(index: Int) {
        do {
            let medicine = medications[index]
            try realmRepo.delete(medicine)
            medications.remove(at: index)
        } catch {
            self.message = "Failed to delete medicine: \(error.localizedDescription)"
        }
    }
}
