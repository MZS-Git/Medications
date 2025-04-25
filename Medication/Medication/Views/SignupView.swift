//
//  ContentView.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 23/04/2025.
//

import SwiftUI

struct SignupView: View {
    
    @AppStorage("isLoggedIn") var isLoggedIn = false
    
    @State  private var userName = ""
    @State  private var email = ""
    @State  private var password = ""
    
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
        
        Spacer()
        
        Button(action: {
            isLoggedIn = true
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
