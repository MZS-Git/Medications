//
//  SplashView.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 23/04/2025.
//

import SwiftUI

/// The splash screen view displayed when the app launches.
/// It shows a branded logo and provides buttons for the user to either sign in or create a new account.
///
/// - Uses:
///   - `NavigationCoordinator` to manage navigation and routing to the sign-in and sign-up screens.
struct SplashView: View {
    
    @StateObject private var coordinator = NavigationCoordinator()
    
    /// The body of the view that displays a full-screen splash screen with a logo
    /// and buttons to navigate to either the sign-in or sign-up screens.
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ZStack {
                Color(UIColor(named: AppColors.splash) ?? .clear)
                    .edgesIgnoringSafeArea(.all)
                VStack() {
                    
                    Spacer()
                    
                    Image(Constants.Image.splashIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    Spacer()
                    
                    Button(action: {
                        coordinator.push(.signUp)
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
                        coordinator.push(.signIn)
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
                // Navigate to the appropriate screen based on the route
                switch route {
                    case .signIn:
                        SignInView()
                    case .signUp:
                        SignupView()
                    case .home:
                        EmptyView()
                    case .search:
                        EmptyView()
                    case .detail:
                        EmptyView()
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
