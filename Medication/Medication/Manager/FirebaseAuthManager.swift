import Foundation
import Combine
import FirebaseAuth

protocol AuthService {
    func signUp(email: String, password: String, name: String) -> AnyPublisher<Void, Error>
    func signIn(email: String, password: String) -> AnyPublisher<Void, Error>
    func signOut() -> AnyPublisher<Void, Error>
}

final class FirebaseAuthManager: AuthService {
    
    // MARK: - Sign Up
    func signUp(email: String, password: String, name: String) -> AnyPublisher<Void, Error> {
        Future<Void, Error> { promise in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    promise(.failure(error))
                } else if let user = result?.user {
                    promise(.success(()))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    // MARK: - Sign In
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
    
    // MARK: - Sign Out
    func signOut() -> AnyPublisher<Void, Error> {
        Future<Void, Error> { promise in
            do {
                try Auth.auth().signOut()
                promise(.success(()))
            } catch {
                promise(.failure(error))
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
