//
//  Untitled.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 25/04/2025.
//

import Foundation
import Combine


class SearchMedicationViewModel: ObservableObject {
    
    @Published var medications: [ConceptProperty] = []
    @Published var notifyMessage: String = "No Results"
    @Published var isLoading: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    func searchMedicine(name: String)  {
        isLoading = true
        NetworkService.shared
            .fetch(from: .getDrugs, queryParams: ["name": name, "expand": "psn"])
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                    case .failure(let error):
                        self?.notifyMessage = error.localizedDescription
                    case .finished:
                        break
                }
            }, receiveValue: { [weak self] (response: DrugResponse) in
                self?.isLoading = false
                let concepts = response.drugGroup.conceptGroup
                    .compactMap { $0.conceptProperties }
                    .flatMap { $0 }
                
                self?.medications = concepts
            })
            .store(in: &cancellables)
    }
    
    func resetSearchResults() {
        medications = []
        notifyMessage = "No Results"
    }
    
}
