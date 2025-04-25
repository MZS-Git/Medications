//
//  MedicineCellVoew.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 23/04/2025.
//

import SwiftUI

struct MedicineCellView: View {
    
    var title: String = ""
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "pills.fill")
                .frame(width: 32, height: 32)
                .font(.title2)
                .foregroundColor(.gray)
                .background(Color.orange)
                .clipShape(.circle)
            
            Text(title)
                .font(.title3)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 40)
    }
}

#Preview {
    MedicineCellView(title: "Hello")
}
