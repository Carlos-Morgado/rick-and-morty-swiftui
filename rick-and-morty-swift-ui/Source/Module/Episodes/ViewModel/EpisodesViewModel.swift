//
//  EpisodesViewModel.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 15/11/23.
//

import Foundation

final class EpisodesViewModel: ObservableObject {
    @Published var episodes: [EpisodeModel] = []
    @Published var searchText = ""
    
    var episodesDataSource: EpisodesDataSource
    
    init(episodesDataSource: EpisodesDataSource = DefaultEpisodesDataSource()) {
        self.episodesDataSource = episodesDataSource
    }
    
    @MainActor
    func onAppear() {
        fetchEpisodes()
    }
    
    @MainActor
    func scrollDidEnd() {
        fetchEpisodes()
    }
    
    @MainActor
    func didSearch() {
        episodes = []
        fetchEpisodes(isNewSearch: true, name: searchText)
    }
}

private extension EpisodesViewModel {
    @MainActor
    func fetchEpisodes(isNewSearch: Bool = false, name: String? = nil) {
        Task {
            do {
                let newEpisodes = try await episodesDataSource.getEpisodes(isNewSearch: isNewSearch, name: name)
                episodes.append(contentsOf: newEpisodes)
            } catch {
                print("Error when obtaining characters: \(error)")
            }
        }
    }
}
