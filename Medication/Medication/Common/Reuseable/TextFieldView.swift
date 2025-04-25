//
//  UserInputField.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 23/04/2025.
//

import SwiftUI

struct TextFieldView: View {
    
    let title: String
    let placeHolder: String
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    
    @Binding var text: String
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(AppColors.textBlack)
                if isSecure {
                    SecureField(placeHolder, text: $text)
                        .foregroundColor(AppColors.textGray)
                } else {
                    TextField(placeHolder, text: $text)
                        .foregroundColor(AppColors.textGray)
                }
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 70, alignment: .leading)
            .background(Color(UIColor.systemGray5))
            .cornerRadius(10)
            .padding(.horizontal)
        }
    }
}
