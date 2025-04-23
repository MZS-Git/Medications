//
//  MedicationsList.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 23/04/2025.
//

import SwiftUI

struct MedicationsList: View {
    
    @State var medications = Array(repeating: "Medicine 1", count: 6)
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text(Constants.myMedications)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
                .padding(.leading, 24)
                .background(AppColors.mainBackground)
            
            List {
                ForEach(medications, id: \.self) { med in
                    MedicineCellView(title: med)
                }
                .onDelete { indexSet in
                    medications.remove(atOffsets: indexSet)
                }
                
            }
            .listStyle(.plain)
            .frame(width: .infinity, alignment: .leading)
            .padding(8)
            .background(AppColors.mainBackground)
            
            Spacer()
            
            Button(action: {
                
            }) {
                Text(Constants.searchMedication)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(AppColors.primaryBlue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
        }
        .background(AppColors.mainBackground)
        
//        Spacer()
        
       
    }
}

#Preview {
    MedicationsList()
}
