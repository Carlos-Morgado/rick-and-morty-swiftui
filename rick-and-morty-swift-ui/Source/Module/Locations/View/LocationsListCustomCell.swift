//
//  LocationsListCustomCell.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 16/11/23.
//

import SwiftUI

struct LocationsListCustomCell: View {
    var name: String
    var type: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            Text(name)
                .font(.system(size: 15))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            Text("Type: \(type)")
                .font(.system(size: 13))
                .italic()
                .fontWeight(.regular)
                .foregroundColor(Color.mainBlueDEF)
        }
    }
}

#Preview {
    LocationsListCustomCell(name: "Name", type: "Type")
        .background(Color.red)
}
