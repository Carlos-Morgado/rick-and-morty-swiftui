//
//  CharacterDataSource.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 29/10/23.
//

import Foundation

protocol CharacterDataSource {
    func getCharacters(isNewSearch: Bool, name: String?) async throws -> [CharacterModel]
}

extension CharacterDataSource {
    func getCharacters(isNewSearch: Bool = false, name: String? = nil) async throws -> [CharacterModel] {
        try await getCharacters(isNewSearch: isNewSearch, name: name)
    }
}

final class DefaultCharacterDataSource {
    private let networkManager: NetworkManager
    private var paginationInfo: AllCharactersModel.Info?
    
    init(networkManager: NetworkManager = DefaultNetworkManager()) {
        self.networkManager = networkManager
    }
}

extension DefaultCharacterDataSource: CharacterDataSource {
    func getCharacters(isNewSearch: Bool = false, name: String? = nil) async throws -> [CharacterModel] {
        do {
            if isNewSearch {
                paginationInfo = nil
            }
            var url: URL?
            var parameters: [NetworkParameter] = []
            
            if let name, !name.isEmpty {
                paginationInfo = nil
                parameters.append(NetworkParameter(query: "name", value: name))
                url = NetworkURL(baseUrl: Constant.baseUrl, endpoint: .character, parameters: parameters).url
            } else {
                if let paginationInfo {
                    // We have pagination info
                    guard let nextUrl = paginationInfo.next else {
                        // Next page doesn't exists, because is the last, we no longer have to ask for more info
                        return []
                    }
                    url = URL(string: nextUrl)
                } else {
                    paginationInfo = nil
                    url = NetworkURL(baseUrl: Constant.baseUrl, endpoint: .character).url
                }
            }
            
            guard let url else {
                fatalError("Invalid URL")
            }
            let allCharactersModel: AllCharactersModel = try await networkManager.execute(url: url, httpMethod: .get)
            self.paginationInfo = allCharactersModel.info
            return allCharactersModel.results
        } catch {
            throw error
        }
    }
    
}
