//
//  MedicationRealm.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 26/04/2025.
//

import Foundation
import RealmSwift

class MedicationRealm: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: String
    @Persisted var name: String = ""
}
