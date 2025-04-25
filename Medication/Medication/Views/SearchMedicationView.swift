//
//  SearchMedicationView.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 25/04/2025.
//

import SwiftUI

struct SearchMedicationView: View {
    
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    @State private var searchText = ""
    @State private var isSearching = false
    
    let medicines = Array(repeating: "Medicine 1", count: 6)
    
    var body: some View {
        List {
            Section(header: Text("Search Results").foregroundColor(.gray)) {
                ForEach(medicines, id: \.self) { medicine in
                    MedicineCellView(title: medicine)
                }
            }
        }
        .searchable(text: $searchText, placement:    .navigationBarDrawer(displayMode: .always), prompt: "Search Medication")
        .onSubmit(of: .search) {
            print("Searching")
        }
        .navigationTitle("Search Medication")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}


#Preview {
    SearchMedicationView()
}
