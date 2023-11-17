//
//  EpisodeCharactersView.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 15/11/23.
//

import SwiftUI
import Kingfisher

struct CharactersSectionView: View {
    
    var name: String
    var status: String
    var image: String
    
    var body: some View {
        VStack(alignment: .leading , spacing: 15) {
            KFImage(URL(string: image)!)
                .resizable()
                .scaledToFill()
                .frame(width: 210, height: 150, alignment: .center)
                .background(Color.blue)
                .clipped()
            
            VStack(alignment: .leading, spacing: 5) {
                Text(name)
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(Color.mainGreen)
                
                Text(status)
                    .font(.system(size: 15))
                    .italic()
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
            }
            .padding(.top, 20)
            .padding(.leading, 15)
            .frame(width: 210, height: 40, alignment: .leading)
            
            Spacer()
        }
        .frame(width: 210, height: 250, alignment: .leading)
        .background(Color.secondaryBackgroundColor)
        .cornerRadius(7)
        .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color.mainBlueDEF, lineWidth: 1))
    }
}

#Preview {
    CharactersSectionView(name: "Name", status: "Status", image: "Image")
}
