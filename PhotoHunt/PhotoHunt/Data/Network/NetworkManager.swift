//
//  NetworkManager.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//

import Foundation

actor NetworkManager {
    static let shared = NetworkManager()
    private let session: URLSession
    
    private init(session: URLSession = .shared) {
        self.session = session
    }
    
    /// Executes a request and decodes the response into the specified type
    func request<T: Decodable>(_ request: URLRequest, responseType: T.Type) async throws -> T {
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return decodedResponse
        } catch {
            print("Decoding error: \(error)")
            throw error
        }
    }
}
