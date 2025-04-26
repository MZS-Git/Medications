//
//  AuthViewModel.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 26/04/2025.
//

import Foundation
import Combine

final class AuthViewModel: ObservableObject {
    
    @Published var authError: String?
    @Published var isAuthenticated = false
    
    private var cancellables = Set<AnyCancellable>()
    private let authService: AuthService
    
    init(authService: AuthService = FirebaseAuthManager()) {
        self.authService = authService
        setupErrorDebounce()
    }
    
    private func setupErrorDebounce() {
        $authError
            .compactMap { $0 }
            .debounce(for: .seconds(2), scheduler: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.authError = nil
            }
            .store(in: &cancellables)
    }
    
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
    
    func signOut() {
        authService.signOut()
            .sink { completion in
                if case .failure(let error) = completion {
                    self.authError = error.localizedDescription
                }
            } receiveValue: {
                self.isAuthenticated = false
            }
            .store(in: &cancellables)
    }
}
