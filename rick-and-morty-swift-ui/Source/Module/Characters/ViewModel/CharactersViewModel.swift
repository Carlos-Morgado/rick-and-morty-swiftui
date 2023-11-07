//
//  CharactersViewModel.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 25/10/23.
//

import Foundation

final class CharactersViewModel: ObservableObject {
    @Published var characters: [CharacterModel] = []
    @Published var searchText = ""
    
    private let characterDataSource: CharacterDataSource
    
    init(characterDataSource: CharacterDataSource = DefaultCharacterDataSource()) {
        self.characterDataSource = characterDataSource
    }
    
    @MainActor 
    func onAppear() {
        fetchCharacters()
    }
    
    @MainActor 
    func scrollDidEnd() {
        fetchCharacters()
    }
    
    @MainActor
    func didSearch() {
        characters = []
        fetchCharacters(isNewSearch: true, name: searchText)
    }
}

private extension CharactersViewModel {
    @MainActor
    func fetchCharacters(isNewSearch: Bool = false, name: String? = nil) {
        Task {
            do {
                let newCharacters = try await characterDataSource.getCharacters(isNewSearch: isNewSearch, name: name)
                characters.append(contentsOf: newCharacters)
            } catch {
                print("Error when obtaining characters: \(error)")
            }
        }
        
    }
}
