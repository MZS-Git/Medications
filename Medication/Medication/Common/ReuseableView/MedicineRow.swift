//
//  MedicineCellVoew.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 23/04/2025.
//

import SwiftUI

/// A view that represents a row displaying a medicine-related item with an icon and title.
/// The row consists of an icon on the left, the title on the right, and a spacer between them.
///
/// - Parameters:
///   - title: The title of the medicine row, displayed next to the icon. Defaults to an empty string.
struct MedicineRow: View {
    
    var title: String = ""
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "pills.fill")
                .frame(width: 32, height: 32)
                .foregroundColor(.gray)
                .background(Color.orange)
                .clipShape(.circle)
            
            Text(title)
                .font(.title3)
                .lineLimit(1)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 40)
    }
}

#Preview {
    MedicineRow(title: "Hello")
}
