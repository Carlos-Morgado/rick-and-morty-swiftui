//
//  LocationDetailView.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 16/11/23.
//

import SwiftUI

struct LocationDetailView: View {
    @StateObject var locationDetailViewModel: LocationDetailViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("location_detail_info_section_title".localized)
                .font(.system(size: 18))
                .fontWeight(.black)
                .foregroundColor(Color.mainGreen)
            
            LazyVGrid(columns: [GridItem()], spacing: 15) {
                ForEach(LocationTypeInfo.allCases, id: \.self) { infoType in
                    DetailInfoCellView(titleInfo: infoType.localizedText, valueInfo: locationDetailViewModel.getInfoCellValue(infoType: infoType))
                }
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
            
            Text("location_detail_residents_section_title".localized)
                .font(.system(size: 18))
                .fontWeight(.black)
                .foregroundColor(Color.mainGreen)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem()], spacing: 15) {
                    ForEach(locationDetailViewModel.residents, id: \.id) { resident in
                        CharactersSectionView(name: resident.name, status: resident.status.localizedText, image: resident.image)
                    }
                }.padding(.leading, 10)
                    .padding(.trailing, 10)
            }
            .frame(height: 252)
           
            Spacer()
        }
        .navigationBarTitle(locationDetailViewModel.location.name, displayMode: .inline)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.mainBackground ?? .black, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .padding(.top, 30)
        .background(Color.mainBackgroundColor)
        .onAppear {
            locationDetailViewModel.onAppear()
        }
       
    }
}

#Preview {
    LocationDetailView(locationDetailViewModel: LocationDetailViewModel(location: LocationsModel(id: 0, name: "name", type: "type", dimension: "dimension", residents: [], url: "url", created: "created")))
}
