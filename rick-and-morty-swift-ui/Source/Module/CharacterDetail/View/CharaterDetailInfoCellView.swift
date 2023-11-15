//
//  CharaterDetailInfoCellView.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 8/11/23.
//

import SwiftUI

struct CharaterDetailInfoCellView: View {
    
    var titleInfo: String
    var valueInfo: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 2) {
            Text(titleInfo)
                .font(.system(size: 12))
                .fontWeight(.bold)
                .foregroundColor(Color.mainBlueDEF)
            
            Text(valueInfo)
                .font(.system(size: 12))
                .fontWeight(.medium)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
        }
        .frame(width: 180, height: 45)
        .background(Color.secondaryBackgroundColor)
        .cornerRadius(7)
        .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color.mainBlueDEF, lineWidth: 1))
        
    }
}

#Preview {
    Group {
        CharaterDetailInfoCellView(titleInfo: "Title info", valueInfo: "Value info")
    }
    
}
