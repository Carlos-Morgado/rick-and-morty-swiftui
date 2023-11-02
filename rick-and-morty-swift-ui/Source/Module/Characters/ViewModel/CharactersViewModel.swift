//
//  CharactersViewModel.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 25/10/23.
//

import Foundation

class CharactersViewModel: ObservableObject {
    @Published var characters: [CharacterModel] = []
    @Published var searchText = ""
    
    private let characterDataSource: CharacterDataSource
    
    init(characterDataSource: CharacterDataSource = DefaultCharacterDataSource()) {
        self.characterDataSource = characterDataSource
    }
    
    @MainActor
    func fetchCharacters() {
        Task {
            do {
                characters = try await characterDataSource.getCharacters()
            } catch {
                print("Error when obtaining characters: \(error)")
            }
        }
        
    }
}

