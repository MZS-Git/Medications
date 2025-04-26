//
//  SwiftUIView.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 23/04/2025.
//

import SwiftUI

struct SignInView: View {
    
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @StateObject var viewModel = AuthViewModel()
    
    @State  private var email = ""
    @State  private var password = ""
    
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
