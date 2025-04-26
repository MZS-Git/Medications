//
//  SwiftUIView.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 23/04/2025.
//

import SwiftUI

/// A view that represents the sign-in screen where users can log in to the application.
/// It includes input fields for the user's email and password, and a button to submit the login form.
/// Displays a toast notification if there is an authentication error.
///
/// - Uses:
///   - `AuthViewModel` for handling the authentication logic.
///   - `TextFieldView` for email and password input fields.
///   - `ToastView` for displaying error messages.
struct SignInView: View {
    
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @StateObject var viewModel = AuthViewModel()
    
    @State  private var email = ""
    @State  private var password = ""
    
    /// The body of the view that contains the sign-in form with email and password fields,
    /// along with a sign-in button. It displays a title and handles login state changes and error messages.
    var body: some View {
        
        Text(Constants.loginTitle)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color.blue)
            .padding(.bottom, 30)
        
        VStack(spacing: 8) {
            
            TextFieldView(title: Constants.email,
                          placeHolder: Constants.PlaceHolders.email,
                          keyboardType: .emailAddress,
                          text: $email)
            
            TextFieldView(title: Constants.password,
                          placeHolder: Constants.PlaceHolders.password,
                          isSecure: true,
                          text: $password)
        }
        .onChange(of: viewModel.isAuthenticated) { newValue in
            isLoggedIn = newValue
        }
        
        Spacer()
        
        if let message = viewModel.authError {
            ToastView(message: message)
        }
        
        Button(action: {
            viewModel.signIn(email: email, password: password)
        }) {
            Text(Constants.login)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(AppColors.primaryBlue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SignInView()
}
