//
//  ContentView.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 23/04/2025.
//

import SwiftUI

/// A view that represents the sign-up screen where users can create a new account.
/// It includes input fields for the user's name, email, and password, and a button to submit the registration form.
/// Displays a toast notification if there is an authentication error.
///
/// - Uses:
///   - `AuthViewModel` for handling the sign-up logic.
///   - `TextFieldView` for name, email, and password input fields.
///   - `ToastView` for displaying error messages.
struct SignupView: View {
    
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @StateObject var viewModel = AuthViewModel()
    
    @State  private var userName = ""
    @State  private var email = ""
    @State  private var password = ""
    
    /// The body of the view that contains the sign-up form with name, email, and password fields,
    /// along with a button to create a new account. It displays a title and handles sign-up state changes and error messages.
    var body: some View {
        Text("Create New Account")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color.blue)
            .padding(.bottom, 30)
        
        VStack(spacing: 8) {
            TextFieldView(title: Constants.name,
                          placeHolder: Constants.PlaceHolders.name,
                          text: $userName)
            
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
            viewModel.signUp(email: email, password: password, name: userName)
        }) {
            Text("Create Account")
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
    SignupView()
}
