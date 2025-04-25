//
//  MedicationsList.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 23/04/2025.
//

import SwiftUI

struct MedicationsListView: View {
    
    @EnvironmentObject var coordinator: NavigationCoordinator
    @State private var medications = Array(repeating: "Medicine 1", count: 6)
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text(Constants.myMedications)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .fontWeight(.bold)
                .foregroundColor(AppColors.textBlack)
                .padding(.leading, 24)
                .background(AppColors.mainBackground)
            
            List {
                ForEach(medications, id: \.self) { med in
                    MedicineRow(title: med)
                }
                .onDelete { indexSet in
                    medications.remove(atOffsets: indexSet)
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(AppColors.mainBackground)
            
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
        
    }
}

#Preview {
    MedicationsListView()
}
