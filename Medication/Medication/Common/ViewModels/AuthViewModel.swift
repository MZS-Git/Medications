//
//  AuthViewModel.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 26/04/2025.
//

import Foundation
import Combine

/// A view model responsible for managing user authentication.
///
/// `AuthViewModel` handles signing in, signing up, and signing out the user
/// while managing authentication errors and publishing authentication status updates

final class AuthViewModel: ObservableObject {
    
    /// A published property to display authentication error messages.
    @Published var authError: String?
    
    /// A published property to display authentication error messages.
    @Published var isAuthenticated = false
    
    /// A  set to hold any Combine cancellables.
    private var cancellables = Set<AnyCancellable>()
    
    /// The authentication service that performs actual authentication operations.
    private let authService: AuthService
    
    /// Initializes the view model with an authentication service.
    ///
    /// - Parameter authService: A service conforming to `AuthService` protocol. Defaults to `FirebaseAuthManager`.
    init(authService: AuthService = FirebaseAuthManager()) {
        self.authService = authService
        setupErrorDebounce()
    }
    
    /// Sets up a Combine pipeline to debounce and clear authentication errors after 2 seconds.
    private func setupErrorDebounce() {
        $authError
            .compactMap { $0 }
            .debounce(for: .seconds(2), scheduler: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.authError = nil
            }
            .store(in: &cancellables)
    }
    
    /// Signs up a user with the given email, password, and name.
    ///
    /// On success, it sets `isAuthenticated` to `true`. On failure, it sets `authError`.
    ///
    /// - Parameters:
    ///   - email: The user's email address.
    ///   - password: The user's password.
    ///   - name: The user's display name.
    func signUp(email: String, password: String, name: String) {
        authService.signUp(email: email, password: password, name: name)
            .sink { completion in
                if case .failure(let error) = completion {
                    self.authError = error.localizedDescription
                }
            } receiveValue: {
                self.isAuthenticated = true
            }
            .store(in: &cancellables)
    }
    
    /// Signs in a user with the given email and password.
    ///
    /// On success, it sets `isAuthenticated` to `true`. On failure, it sets `authError`.
    ///
    /// - Parameters:
    ///   - email: The user's email address.
    ///   - password: The user's password.
    func signIn(email: String, password: String) {
        authService.signIn(email: email, password: password)
            .sink { completion in
                if case .failure(let error) = completion {
                    self.authError = error.localizedDescription
                }
            } receiveValue: {
                self.isAuthenticated = true
            }
            .store(in: &cancellables)
    }
}
