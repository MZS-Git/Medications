//
//  SplashView.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 23/04/2025.
//

import SwiftUI

struct SplashView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color(AppColors.splashBackground)
                    .ignoresSafeArea()
                
                VStack() {
                    
                    Spacer()
                    
                    Image(Constants.Image.splashIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    Spacer()
                    
                    Button(action: {
                        path.append(NavigationRoute.signUp)
                    }) {
                        Text(Constants.createAccountTitle)
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(AppColors.primaryBlue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    Button(action: {
                        path.append(NavigationRoute.signIn)
                    }) {
                        Text(Constants.alreadyHaveAccount)
                            .font(.subheadline)
                            .foregroundColor(Color.blue)
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 20)
            }
            .navigationDestination(for: NavigationRoute.self) { route in
                switch route {
                    case .signIn:
                        SignInView()
                    case .signUp:
                        SignupView()
                }
            }
            .navigationBarBackButtonHidden(false)
            .navigationTitle("")
        }
        
    }
}

#Preview {
    SplashView()
}
