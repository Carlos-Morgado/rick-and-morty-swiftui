//
//  CharacterEpisodesView.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 8/11/23.
//

import SwiftUI

struct CharacterEpisodesView: View {
    
    var episode: String
    var name: String
    var airDate: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(episode)
                .font(.system(size: 15))
                .fontWeight(.bold)
                .foregroundColor(Color.mainGreen)
                
            Text(name)
                .font(.system(size: 13))
                .italic()
                .fontWeight(.regular)
                .foregroundColor(Color.white)
            
            Text(airDate)
                .font(.system(size: 13))
                .fontWeight(.regular)
                .foregroundColor(Color.mainBlueDEF)
        }
        .frame(width: 210, height: 90, alignment: .leading)
        .padding(.leading, 15)
        .background(Color.secondaryBackgroundColor)
        .cornerRadius(7)
        .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color.mainBlueDEF, lineWidth: 1))
    }
}

#Preview {
    CharacterEpisodesView(episode: "Episode Code", name: "Name", airDate: "Air Date")
}
