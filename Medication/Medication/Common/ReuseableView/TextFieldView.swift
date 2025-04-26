//
//  UserInputField.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 23/04/2025.
//

import SwiftUI

/// A custom view representing an input field with a label and a secure or regular text input.
/// It allows you to display a labeled text field with optional secure input and customizable keyboard type.
///
/// - Parameters:
///   - title: The label for the text field, describing what the input is for.
///   - placeHolder: The placeholder text that appears when the field is empty.
///   - isSecure: A flag indicating whether the text field should use a secure input (default is `false`).
///   - keyboardType: The type of keyboard to display (default is `.default`).
///   - text: A binding to a string value that holds the input text.
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
