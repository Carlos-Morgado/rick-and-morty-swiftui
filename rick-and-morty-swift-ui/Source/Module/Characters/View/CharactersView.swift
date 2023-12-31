//
//  CharactersView.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 25/10/23.
//

import SwiftUI
import Kingfisher

struct CharactersView: View {
    @StateObject var charactersViewModel: CharactersViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                List{
                    ForEach(charactersViewModel.characters, id: \.id) { character in
                        NavigationLink(destination: CharacterDetailView(characterDetailViewModel: CharacterDetailViewModel(character: character))) {
                            CharactersCell(name: character.name, status: character.status.localizedText, species: character.species, location: character.location.name, image: character.image)
                        }
                        .onAppear {
                            if character == charactersViewModel.characters.last {
                                charactersViewModel.scrollDidEnd()
                            }
                        }
                        .customNavigationLinkStyle()
                    }
                    .listRowBackground(Color.clear)
                        .listRowSeparatorTint(.clear)
                        .listRowInsets(.init(top: 15, leading: 15, bottom: 5, trailing: 15))
                        .listRowSeparator(.hidden)
                }
                .navigationTitle("characters_screen_navigation_title".localized)
                .toolbarBackground(Color.mainBackground ?? .black, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar)
                .scrollContentBackground(.hidden)
                .background(Color.mainBackgroundColor)
                .listStyle(.plain)
            }
        }
        
        .searchable(text: $charactersViewModel.searchText, placement: .navigationBarDrawer(displayMode: .automatic), prompt: Text("characters_searchbar_placeholder".localized))
        .onChange(of: charactersViewModel.searchText, { _, _ in
            charactersViewModel.didSearch()
        })
        .onAppear {
            charactersViewModel.onAppear()
            UISearchBar.appearance().tintColor = .mainGreen
            UISearchBar.appearance().searchTextField.textColor = .white
        }
        
    }
}

// MARK: - EXTENSIONS

struct CustomNavigationLinkStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.mainGreen.opacity(5.0)) // Changes the colour of the text and therefore of the arrow.
    }
}

extension View {
    func customNavigationLinkStyle() -> some View {
        self.modifier(CustomNavigationLinkStyle())
    }
}



#Preview {
    CharactersView(charactersViewModel: CharactersViewModel())
}
