//
//  EpisodeDetailViewModel.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 16/11/23.
//

import Foundation

final class EpisodeDetailViewModel: ObservableObject {
    @Published var episode: EpisodeModel
    @Published var characters: [CharacterModel] = []
    
    private let charactersDataSource: CharacterDataSource = DefaultCharacterDataSource()
    
    
    init(episode: EpisodeModel) {
        self.episode = episode
    }
    
    @MainActor
    func onAppear() {
        fetchCharacters()
    }
    
    func getInfoCellValue(infoType: EpisodeTypeInfo) -> String {
        var value: String = ""
        switch infoType {
        case .name:
            value = episode.name
        case .airDate:
            value = episode.airDate
        case .episode:
            value = episode.episode
        }
        
        return value
        
    }
}

private extension EpisodeDetailViewModel {
    
    @MainActor
    func fetchCharacters() {
        for url in episode.characters {
            Task {
                do {
                    let characterModel = try await charactersDataSource.getCharacterDetail(urlString: url)
                    characters.append(characterModel)
                    characters.sort {$0.id < $1.id}
                } catch {
                    print("Error getting character episode: \(error)")
                }
            }
            
        }
    }
}
