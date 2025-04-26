//
//  Untitled.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 25/04/2025.
//

import Foundation
import Combine

/// A view model responsible for searching medications from a network service.
///
/// `SearchMedicationViewModel` manages the loading state, search results, and any error or empty state messages.
class SearchMedicationViewModel: ObservableObject {
    
    /// A published array of medications fetched from the network based on search queries.
    @Published var medications: [ConceptProperty] = []
    
    /// A published message shown when no results are found or an error occurs.
    @Published var notifyMessage: String = "No Results"
    
    /// A published boolean indicating whether a network request is currently in progress.
    @Published var isLoading: Bool = false
    
    /// A set of cancellables to manage Combine subscriptions.
    private var cancellables = Set<AnyCancellable>()
    
    /// Searches for medications matching the provided name.
    ///
    /// Initiates a network request to fetch medications. Updates the `medications` list on success
    /// or the `notifyMessage` on failure. Also manages the `isLoading` state throughout the request.
    ///
    /// - Parameter name: The name of the medication to search for.
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
    
    /// Resets the search results and notify message to default values.
    func resetSearchResults() {
        medications = []
        notifyMessage = "No Results"
    }
    
}
