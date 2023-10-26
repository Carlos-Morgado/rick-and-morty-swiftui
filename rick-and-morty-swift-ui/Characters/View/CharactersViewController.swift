//
//  CharactersViewController.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 25/10/23.
//

import SwiftUI

struct CharactersViewController: View {
    @StateObject private var charactersViewViewModel = CharactersViewViewModel()
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            List(charactersViewViewModel.characters, id: \.id) { character in
                Text(character.name)
            }
            .onAppear {
                Task {
                    do {
                        try await charactersViewViewModel.fetchCharacters()
                    } catch {
                        print("Error")
                    }
                }
            }
        }
        .navigationTitle("Characters")
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic), prompt: Text("Find a character"))
    }
}

#Preview {
    CharactersViewController()
}
