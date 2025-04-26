//
//  DetailMedicationView.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 26/04/2025.
//

import SwiftUI

import SwiftUI


struct MedicationDetailView: View {
    
    @EnvironmentObject var coordinator: NavigationCoordinator
    @StateObject var viewModel: DetailMedicationViewModel
    
    init(medicationItem: ConceptProperty) {
        _viewModel = StateObject(wrappedValue: DetailMedicationViewModel(
            realmRepo: RealmDBRepository<MedicationRealm>(),
            medicine: medicationItem
        ))
    }
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 8) {
            Image(systemName: Constants.Image.pill)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
                .background(Color.orange)
                .clipShape(.circle)
                .padding(12)
            
            Text(viewModel.medicine.name)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(AppColors.textBlack)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .padding(.horizontal)
            
            Text(viewModel.medicine.synonym)
                .font(.title3)
                .fontWeight(.regular)
                .foregroundStyle(AppColors.textGray)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text(Constants.detail)
                        .font(.title3)
                        .fontWeight(.regular)
                        .foregroundStyle(AppColors.textGray)
                        .padding(.init(top: 12, leading: 12, bottom: 0, trailing: 0))
                    ForEach(viewModel.medicine.mockDetail ?? []) { section in
                        BulletView(
                            title: section.title,
                            items: section.items
                        )
                    }
                }
                .background(AppColors.white)
                .cornerRadius(10)
                .shadow(radius: 1)
                .padding()
            }
            
            Spacer()
            
            Button(action: {
                viewModel.addToMedicationList()
                coordinator.dismissSheet()
                coordinator.popToRoot()
            }) {
                Text(Constants.addToMedication)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(AppColors.primaryBlue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .background(AppColors.mainBackground)
    }
}
