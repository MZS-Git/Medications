//
//  Toast.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 26/04/2025.
//

import SwiftUI

struct ToastView: View {
    let message: String
    
    var body: some View {
        Text(message)
            .frame(maxWidth: .infinity, minHeight: 60, alignment: .leading)
            .padding(4)
            .multilineTextAlignment(.center)
            .font(.subheadline)
            .lineLimit(2)
            .foregroundColor(AppColors.white)
            .background(Color.red)
            .cornerRadius(8)
            .shadow(radius: 10)
            .padding(.horizontal)

    }
}

