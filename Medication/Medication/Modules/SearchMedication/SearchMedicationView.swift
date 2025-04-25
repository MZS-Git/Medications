//
//  SearchMedicationView.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 25/04/2025.
//

import SwiftUI

struct SearchMedicationView: View {
    
    @EnvironmentObject var coordinator: NavigationCoordinator
    @StateObject var viewModel = SearchMedicationViewModel()
    
    @State private var searchText = ""
    @State private var isSearching = false
    
   
    
    var body: some View {
        
        List {
            Section(header: Text("Search Results").foregroundColor(.gray)) {
                if viewModel.medications.isEmpty && !viewModel.isLoading {
                    Text(viewModel.notifyMessage).foregroundColor(.gray)
                } else {
                    ForEach(viewModel.medications) { medicine in
                        MedicineRow(title: medicine.name)
                            .onTapGesture {
                                coordinator.present(.detail(selectedMedicine: medicine))
                            }
                    }
                }
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Medication")
        .onSubmit(of: .search) {
            viewModel.searchMedicine(name: searchText)
        }
        .onChange(of: searchText, { oldValue, newValue in
            if newValue.isEmpty {
                viewModel.resetSearchResults()
            }
        })
        .navigationTitle("Search Medication")
        .navigationBarTitleDisplayMode(.inline)
        .overlay {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: AppColors.primaryBlue))
                    .scaleEffect(1.5)
                    .padding()
                    .animation(.bouncy, value: viewModel.isLoading)
            }
        }
        
    }
}


#Preview {
    SearchMedicationView()
}
