//
//  EpisodesListCustomCell.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 15/11/23.
//

import SwiftUI

struct EpisodesListCustomCell: View {
    var episode: String
    var name: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(episode)
                .font(.system(size: 13))
                .fontWeight(.bold)
                .foregroundColor(Color.mainBlueDEF)
            Text(name)
                .font(.system(size: 15))
                .italic()
                .fontWeight(.regular)
                .foregroundColor(Color.white)
        }
    }
}

#Preview {
    EpisodesListCustomCell(episode: "Episode Code", name: "Episode Name")
        .background(Color.red)
}
