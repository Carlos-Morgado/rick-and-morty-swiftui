//
//  EpisodeDetailInfoCellView.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 15/11/23.
//

import SwiftUI

struct EpisodeDetailInfoCellView: View {
    var titleInfo: String
    var valueInfo: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Text(titleInfo)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundColor(Color.mainBlueDEF)
            
            Text(valueInfo)
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
        }
        .frame(height: 80)
        .frame(maxWidth: .infinity)
        .background(Color.secondaryBackgroundColor)
        .cornerRadius(7)
        .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color.mainBlueDEF, lineWidth: 1))
        
    }
}

#Preview {
    EpisodeDetailInfoCellView(titleInfo: "Title Info", valueInfo: "Value Info")
}
