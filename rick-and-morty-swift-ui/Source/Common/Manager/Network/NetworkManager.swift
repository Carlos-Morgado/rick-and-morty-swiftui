//
//  NetworkManager.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 26/10/23.
//

import Foundation

protocol NetworkManager {
    
    func execute<T: Decodable>(url: URL, httpMethod: NetworkHttpMethod) async throws -> T
}

struct DefaultNetworkManager {
    
    private let session: URLSession
        
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}

extension DefaultNetworkManager: NetworkManager  {
    
    func execute<T: Decodable>(url: URL, httpMethod: NetworkHttpMethod) async throws -> T {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        do {
            let result: (data: Data, response: URLResponse) = try await session.data(for: request)
            guard let statusCode = (result.response as? HTTPURLResponse)?.statusCode else {
                throw NetworkError.invalidResponse
            }
            
            guard 200...299 ~= statusCode else {
                throw NetworkError.invalidStatusCode(statusCode)
            }
            
            let response = try JSONDecoder().decode(T.self, from: result.data)
            return response
        } catch {
            throw error
        }
    }
}
    

