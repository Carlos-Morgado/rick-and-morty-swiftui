//
//  EpisodesView.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 15/11/23.
//

import SwiftUI

struct EpisodesView: View {
    @StateObject var episodesViewModel: EpisodesViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(episodesViewModel.episodes, id: \.id) { episode in
                    NavigationLink(destination: EpisodeDetailView(episodeDetailViewModel: EpisodeDetailViewModel(episode: episode))) {
                        EpisodesListCustomCell(episode: episode.episode, name: episode.name)
                    }
                    .onAppear {
                        if episode == episodesViewModel.episodes.last {
                            episodesViewModel.scrollDidEnd()
                        }
                    }
                    .customNavigationLinkStyle()
                }
                .listRowBackground(Color.secondaryBackgroundColor)
                .listRowSeparatorTint(Color.mainBlueDEF)
                .listRowInsets(.init(top: 20, leading: 15, bottom: 10, trailing: 15))
            }
            .navigationTitle("episodes_screen_navigation_title".localized)
            .toolbarBackground(Color.mainBackground ?? .black, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .scrollContentBackground(.hidden)
            .background(Color.mainBackgroundColor)
        }
        .searchable(text: $episodesViewModel.searchText, placement: .navigationBarDrawer(displayMode: .automatic), prompt: Text("episodes_searchbar_placeholder".localized))
        .onChange(of: episodesViewModel.searchText, { _, _ in
            episodesViewModel.didSearch()
        })
        .onAppear {
            episodesViewModel.onAppear()
            UISearchBar.appearance().tintColor = .mainGreen
            UISearchBar.appearance().searchTextField.textColor = .white
        }
    }
}

#Preview {
    EpisodesView(episodesViewModel: EpisodesViewModel())
}
