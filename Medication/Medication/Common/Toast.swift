//
//  Toast.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 26/04/2025.
//

import SwiftUI

/// A view that displays a temporary toast notification with a message.
/// The toast is typically used to display brief alerts or feedback to the user.
///
/// - Parameters:
///   - message: The message to be displayed in the toast.
struct ToastView: View {
    
    /// The message to be shown in the toast notification.
    let message: String
    
    /// The body of the view that displays the toast message with a red background,
    /// white text, and rounded corners. It is styled to appear with padding, a shadow,
    /// and a multiline text alignment.
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

