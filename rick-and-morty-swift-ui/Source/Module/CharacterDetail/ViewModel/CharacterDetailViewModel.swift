//
//  CharacterDetailViewModel.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 7/11/23.
//

import Foundation

final class CharacterDetailViewModel: ObservableObject {
    @Published var character: CharacterModel
    @Published var episodes: [EpisodeModel] = []
    
    private let episodesDataSource: EpisodesDataSource = DefaultEpisodesDataSource()
    
    static let apiToDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
        formatter.timeZone = .current
        return formatter
    }()
    
    static let dateToStringFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.timeZone = .current
        return formatter
    }()
    
    init(character: CharacterModel) {
        self.character = character
    }
    
    @MainActor
    func onAppear() {
        fetchEpisodes()
    }
    
    func getInfoCellValue(infoType: CharacterTypeInfo) -> String {
        var value: String = ""
        switch infoType {
        case .status:
            value = character.status.localizedText
        case .gender:
            value = character.gender.localizedText
        case .type:
            value = character.type.isEmpty ? "None" : character.type
        case .species:
            value = character.species
        case .origin:
            value = character.origin.name.capitalized
        case .created:
            if let date = Self.apiToDateFormatter.date(from: character.created) {
                value = Self.dateToStringFormatter.string(from: date)
            }
        case .location:
            value = character.location.name
        case .episodeCount:
            value = String(character.episode.count)
        }
        
        return value
    }
}

private extension CharacterDetailViewModel {
    
    @MainActor
    func fetchEpisodes() {
        for url in character.episode {
            Task {
                do {
                    let episodeModel = try await episodesDataSource.getEpisodeDetail(urlString: url)
                    episodes.append(episodeModel)
                } catch {
                    print("Error getting character episode: \(error)")
                }
            }
            
        }
    }
    
}
