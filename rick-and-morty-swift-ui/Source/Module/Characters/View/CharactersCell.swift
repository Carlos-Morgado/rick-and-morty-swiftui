//
//  CharactersCell.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 29/10/23.
//

import SwiftUI
import Kingfisher

struct CharactersCell: View {
    
    var name: String
    var status: String
    var species: String
    var location: String
    var image: String
    
    var body: some View {
        HStack {
            KFImage(URL(string: image)!)
                .resizable()
                .padding(0.0)
                .frame(width: 120, height: 120, alignment: .center)
                .background(Color.blue)
            VStack(alignment: .leading, spacing: 15) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(name)
                        .font(.system(size: 18))
                        .fontWeight(.black)
                        .foregroundColor(Color.mainGreen)
                    HStack(spacing: 5) {
                        Circle().foregroundColor(Color.mainBlueDEF)
                            .frame(width: 10)
                        Text(status)
                            .font(.system(size: 13))
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                            .padding(.trailing, 10)
                        Image(systemName: "circle.fill")
                            .resizable()
                            .padding(0.0)
                            .foregroundColor(Color.mainBlueDEF)
                            .frame(width: 10, height: 10)
                        Text(species)
                            .font(.system(size: 13))
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                    }
                }
                VStack(alignment: .leading, spacing: 2) {
                    Text("character_location_label_title".localized)
                        .font(.system(size: 13))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.mainBlueDEF)
                    Text(location)
                        .font(.system(size: 13))
                        .fontWeight(.regular)
                        .foregroundColor(Color.white)
                }
            }.padding(.leading, 5)
            Spacer()
        }.background(Color.secondaryBackgroundColor)
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.mainBlueDEF, lineWidth: 1))
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            
    }
    
}

#Preview {
    Group {
        CharactersCell(name: "Name", status: "Status", species: "Species", location: "Location", image: "image")
    }
}
