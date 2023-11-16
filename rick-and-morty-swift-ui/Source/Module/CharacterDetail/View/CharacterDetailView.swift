//
//  CharacterDetailView.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 7/11/23.
//

import SwiftUI
import Kingfisher

struct CharacterDetailView: View {
    @StateObject var characterDetailViewModel: CharacterDetailViewModel
    
    var body: some View {
        VStack {
            KFImage(URL(string: characterDetailViewModel.character.image)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
                    
            VStack(spacing: 20) {
                    VStack(spacing: 5) {
                        Text("character_detail_name_title".localized)
                            .font(.system(size: 18))
                            .fontWeight(.black)
                            .foregroundColor(Color.mainGreen)
                        
                        Text(characterDetailViewModel.character.name)
                            .font(.system(size: 21))
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                    }
                    
                    VStack(spacing: 10) {
                        Text("caracter_detail_info_section_title".localized)
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                            .foregroundColor(Color.mainGreen)
                        
                        LazyVGrid(columns: [GridItem(spacing: 25), GridItem()], spacing: 10) {
                            ForEach(CharacterTypeInfo.allCases, id: \.self) { infoType in
                                CharaterDetailInfoCellView(titleInfo: infoType.localizedText , valueInfo: characterDetailViewModel.getInfoCellValue(infoType: infoType))
                            }
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    }
                    
                    VStack(spacing: 10) {
                        Text("character_detail_episodes_section_title".localized)
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                            .foregroundColor(Color.mainGreen)
                        
                        ScrollView(.horizontal) {
                            LazyHGrid(rows: [GridItem()], spacing: 15) {
                                ForEach(characterDetailViewModel.episodes, id: \.id) { episode in
                                    CharacterEpisodesView(episode: episode.episode, name: episode.name, airDate: episode.airDate)
                                }
                            }
                            .frame(height: 102)
                            .padding(.leading, 10)
                            .padding(.trailing, 10)
                        }
                    }
            }.padding(.top, 10)
            
            Spacer()
        }
        .navigationBarTitle(characterDetailViewModel.character.name, displayMode: .inline)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.mainBackground ?? .black, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .background(Color.mainBackgroundColor)
        .onAppear {
            characterDetailViewModel.onAppear()
        }
    }
}

#Preview {
    CharacterDetailView(characterDetailViewModel: CharacterDetailViewModel(character: CharacterModel(id: 0, name: "Name", status: CharacterStatusModel.alive, species: "Species", type: "Type", gender: CharacterGenderModel.female, origin: CharacterOriginModel(name: "Origin name", url: "Origin url"), location: CharacterLocationModel(name: "Location name", url: "Location url"), image: "https://lafrikileria.com/blog/wp-content/uploads/2023/06/series-parecidas-rick-morty.jpg", episode: [], url: "URL", created: "Created")))
}
