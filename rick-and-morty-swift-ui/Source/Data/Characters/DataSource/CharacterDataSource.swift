//
//  CharacterDataSource.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 29/10/23.
//

import Foundation

protocol CharacterDataSource {
    func getCharacters() async throws -> [CharacterModel]
}

final class DefaultCharacterDataSource {
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = DefaultNetworkManager()) {
        self.networkManager = networkManager
    }
}

extension DefaultCharacterDataSource: CharacterDataSource {
    func getCharacters() async throws -> [CharacterModel] {
        do {
            let apiUrl = NetworkURL(baseUrl: Constant.baseUrl, endpoint: .character).url!
            let allCharactersModel: AllCharactersModel = try await networkManager.execute(url: apiUrl, httpMethod: .get)
            return allCharactersModel.results
        } catch {
            throw error
        }
    }
    
}
