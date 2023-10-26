//
//  CharactersViewViewModel.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 25/10/23.
//

import Foundation

class CharactersViewViewModel: ObservableObject {
    @Published var characters: [CharacterModel] = []
    
    func fetchCharacters() async throws {
        guard let apiUrl = URL(string: "https://rickandmortyapi.com/api/character") else {
            return
        }
        let (data,_) = try await URLSession.shared.data(from: apiUrl)
        let characters = try JSONDecoder().decode([CharacterModel].self, from: data)
        self.characters = characters
    }
}
