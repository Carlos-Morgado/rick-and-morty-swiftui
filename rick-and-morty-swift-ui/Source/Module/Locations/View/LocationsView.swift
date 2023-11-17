//
//  LocationsView.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 16/11/23.
//

import SwiftUI

struct LocationsView: View {
    @StateObject var locationsViewModel: LocationsViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(locationsViewModel.locations, id: \.id) { location in
                    NavigationLink(destination: LocationDetailView(locationDetailViewModel: LocationDetailViewModel(location: location))) {
                        LocationsListCustomCell(name: location.name, type: location.type)
                    }
                    .onAppear {
                        if location == locationsViewModel.locations.last {
                            locationsViewModel.scrollDidEnd()
                        }
                    }
                    .customNavigationLinkStyle()
                }
                .listRowBackground(Color.secondaryBackgroundColor)
                .listRowSeparatorTint(Color.mainBlueDEF)
                .listRowInsets(.init(top: 20, leading: 15, bottom: 10, trailing: 15))
            }
            .navigationTitle("locations_screen_navigation_title".localized)
            .toolbarBackground(Color.mainBackground ?? .black, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .scrollContentBackground(.hidden)
            .background(Color.mainBackgroundColor)
        }
        .searchable(text: $locationsViewModel.searchText, placement: .navigationBarDrawer(displayMode: .automatic), prompt: Text("locations_searchbar_placeholder".localized))
        .onChange(of: locationsViewModel.searchText, { _, _ in
            locationsViewModel.didSearch()
        })
        .onAppear {
            locationsViewModel.onAppear()
            UISearchBar.appearance().tintColor = .mainGreen
            UISearchBar.appearance().searchTextField.textColor = .white
        }
    }
}

#Preview {
    LocationsView(locationsViewModel: LocationsViewModel())
}
