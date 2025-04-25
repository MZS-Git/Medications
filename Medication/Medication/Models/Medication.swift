//
//  Medication.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 26/04/2025.
//


import Foundation

struct DrugResponse: Decodable {
    let drugGroup: DrugGroup
}

struct DrugGroup: Decodable {
    let name: String?
    let conceptGroup: [ConceptGroup]
}

struct ConceptGroup: Decodable {
    let tty: String
    let conceptProperties: [ConceptProperty]?
}

struct ConceptProperty: Decodable, Identifiable, Hashable {
    var id: String { name }  // To conform to Identifiable for SwiftUI lists
    let rxcui: String
    let name: String
    let synonym: String
    let tty: String
    let language: String
    let suppress: String
    let umlscui: String
    var mockDetail: [MockDetail]? {
        return fetchMedicationSections()
    }
    
    private func fetchMedicationSections() -> [MockDetail] {
        return [
            MockDetail(
                id: "1",
                title: "Tablet",
                items: [
                    "Adult: 1-2 tablets every 4 to 6 hours up to a maximum of 4 gm (8 tablets) daily",
                    "Children (6-12 years): ½ to 1 tablet 3 to 4 times daily. For long term treatment it is wise not to exceed the dose beyond 2.6 gm/day"
                ]
            ),
            MockDetail(
                id: "2",
                title: "Extended Release Tablet",
                items: [
                    "Adults & Children over 12 years: Two tablets, swallowed whole, every 6 to 8 hours (maximum of 6 tablets in any 24 hours).The tablet must not be crushed."
                ]
            ),
            MockDetail(
                id: "3",
                title: "Syrup/Suspension",
                items: [
                    "Children under 3 months: 10 mg/kg bod weight (reduce to 5 ma/ka"
                ]
            )
        ]
    }
}


