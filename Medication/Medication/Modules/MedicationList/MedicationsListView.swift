//
//  MedicationsList.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 23/04/2025.
//

import SwiftUI

struct MedicationsListView: View {
    
    @EnvironmentObject var coordinator: NavigationCoordinator
    @StateObject var viewModel = MedicationListViewModel(realmRepo: RealmDBRepository<MedicationRealm>())
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Text(Constants.myMedications)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .fontWeight(.bold)
                .foregroundColor(AppColors.textBlack)
                .padding(.leading, 24)
                .background(AppColors.mainBackground)
            if viewModel.medications.isEmpty {
                Text(viewModel.message)
                    .padding()
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, minHeight: 60, alignment: .center)
                    .background(AppColors.white)
                    .foregroundColor(AppColors.textGray)
                    .cornerRadius(12)
                    .padding()
                
            } else {
                List {
                    ForEach(viewModel.medications, id: \.self) { med in
                        MedicineRow(title: med.name)
                    }
                    .onDelete { indexSet in
                        if let index = indexSet.first {
                            viewModel.deleteMedication(index: index)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(AppColors.mainBackground)
            }
            
            Spacer()
            
            Button(action: {
                coordinator.push(.search)
            }) {
                HStack(spacing: 8) {
                    Image(systemName: Constants.Image.plusCircle)
                    Text(Constants.searchMedication)
                        .font(.headline)
                        .foregroundColor(AppColors.primaryBlue)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .background(AppColors.mainBackground)
        .onAppear {
            viewModel.fetchMedications()
        }
    }
}

#Preview {
    MedicationsListView()
}
