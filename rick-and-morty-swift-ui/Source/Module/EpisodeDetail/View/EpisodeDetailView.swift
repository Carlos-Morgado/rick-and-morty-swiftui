//
//  EpisodeDetailView.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 15/11/23.
//

import SwiftUI

struct EpisodeDetailView: View {
    @StateObject var episodeDetailViewModel: EpisodeDetailViewModel
    
    var body: some View {
        VStack(spacing: 25) {
            Text("episode_detail_info_section_title".localized)
                .font(.system(size: 18))
                .fontWeight(.black)
                .foregroundColor(Color.mainGreen)
            
            LazyVGrid(columns: [GridItem()], spacing: 15) {
                ForEach(EpisodeTypeInfo.allCases, id: \.self) { infoType in
                    EpisodeDetailInfoCellView(titleInfo: infoType.localizedText, valueInfo: episodeDetailViewModel.getInfoCellValue(infoType: infoType))
                }
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
            
            Text("episode_detail_characters_section_title".localized)
                .font(.system(size: 18))
                .fontWeight(.black)
                .foregroundColor(Color.mainGreen)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem()], spacing: 15) {
                    ForEach(episodeDetailViewModel.characters, id: \.id) { character in
                        EpisodeCharactersView(name: character.name, status: character.status.localizedText, image: character.image)
                    }
                }.padding(.leading, 10)
                    .padding(.trailing, 10)
            }
            .frame(height: 222)
           
            Spacer()
        }
        .padding(.top, 20)
        .background(Color.mainBackgroundColor)
        .onAppear {
            episodeDetailViewModel.onAppear()
        }
    }
}

#Preview {
    EpisodeDetailView(episodeDetailViewModel: EpisodeDetailViewModel(episode: EpisodeModel(id: 1, name: "Pilot", airDate: "Air Date", episode: "Episode", characters: [], url: "url", created: "Created")))
}
