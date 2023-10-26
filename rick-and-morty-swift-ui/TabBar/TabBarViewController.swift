//
//  TabBarViewController.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 25/10/23.
//

import SwiftUI

struct TabBarViewController: View {
    var body: some View {
        TabView {
            CharactersViewController()
                .tabItem {
                    Image(systemName: "person")
                    Text("Characters")
                }
        }
    }
}

#Preview {
    TabBarViewController()
}
