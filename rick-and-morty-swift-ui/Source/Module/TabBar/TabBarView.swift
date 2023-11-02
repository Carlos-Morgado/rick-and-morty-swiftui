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
            CharactersView()
                .tabItem {
                    Label("characters_screen_tabbar_title".localized, systemImage: "person.fill")
                }
                .toolbarBackground(Color.mainBackground ?? .black, for: .tabBar)
                .toolbar(.visible, for: .tabBar)
        }
    }
}

#Preview {
    TabBarView()
}
