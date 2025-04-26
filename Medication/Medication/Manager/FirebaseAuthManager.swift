import Foundation
import Combine
import FirebaseAuth

protocol AuthService {
    func signUp(email: String, password: String, name: String) -> AnyPublisher<Void, Error>
    func signIn(email: String, password: String) -> AnyPublisher<Void, Error>
}

/// A concrete implementation of the `AuthService` protocol using Firebase Authentication.
final class FirebaseAuthManager: AuthService {
    
    // MARK: - Sign Up
    
    /// Signs up a new user with the provided email, password, and name.
    ///
    /// This method uses Firebase Authentication to create a new user.
    ///
    /// - Parameters:
    ///   - email: The email of the user.
    ///   - password: The password for the user.
    ///   - name: The name of the user.
    /// - Returns: A publisher that emits `Void` on success or an `Error` on failure.
    func signUp(email: String, password: String, name: String) -> AnyPublisher<Void, Error> {
        Future<Void, Error> { promise in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    promise(.failure(error))
                } else if let _ = result?.user {
                    promise(.success(()))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    // MARK: - Sign In
    
    /// Signs in an existing user with the provided email and password.
    ///
    /// This method uses Firebase Authentication to sign in an existing user.
    ///
    /// - Parameters:
    ///   - email: The email of the user.
    ///   - password: The password for the user.
    /// - Returns: A publisher that emits `Void` on success or an `Error` on failure.
    func signIn(email: String, password: String) -> AnyPublisher<Void, Error> {
        Future<Void, Error> { promise in
            Auth.auth().signIn(withEmail: email, password: password) { _, error in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(()))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
