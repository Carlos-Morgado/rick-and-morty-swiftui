//
//  TabBarViewController.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 25/10/23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            CharactersView(charactersViewModel: CharactersViewModel())
                .tabItem {
                    Label("characters_screen_tabbar_title".localized, systemImage: "person.fill")
                }
                .toolbarBackground(Color.mainBackgroundColor, for: .tabBar)
                .toolbar(.visible, for: .tabBar)
            
            EpisodesView(episodesViewModel: EpisodesViewModel())
                .tabItem {
                    Label("episodes_screen_tabbar_title".localized, systemImage: "tv")
                }
                .toolbarBackground(Color.mainBackgroundColor, for: .tabBar)
                .toolbar(.visible, for: .tabBar)
        }
    }   
}

#Preview {
    TabBarView()
}
