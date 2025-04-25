//
//  NetworkService.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 25/04/2025.
//

import Foundation
import Combine

final class NetworkService {
    
    static let shared = NetworkService()
    
    func fetch<T: Decodable>(from endpoint: Endpoint,
                             queryParams: [String: Any]? = nil) -> AnyPublisher<T, Error> {
        
        var components = URLComponents(string: Constants.URL.baseURL + endpoint.path)
        
        if let queryParams = queryParams {
            components?.queryItems = queryParams.map {
                URLQueryItem(name: $0.key, value: "\($0.value)")
            }
        }
        
        guard let url = components?.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

