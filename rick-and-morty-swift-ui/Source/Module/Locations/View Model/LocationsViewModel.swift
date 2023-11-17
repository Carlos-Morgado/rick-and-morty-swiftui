//
//  LocationsViewModel.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 16/11/23.
//

import Foundation

final class LocationsViewModel: ObservableObject {
    @Published var locations: [LocationsModel] = []
    @Published var searchText = ""
    
    var locationsDataSource: LocationsDataSource
    
    init(locationsDataSource: LocationsDataSource = DefaultLocationsDataSource()) {
        self.locationsDataSource = locationsDataSource
    }
    
    @MainActor
    func onAppear() {
        fetchLocations()
    }
    
    @MainActor
    func scrollDidEnd() {
        fetchLocations()
    }
    
    @MainActor
    func didSearch() {
        locations = []
        fetchLocations(isNewSearch: true, name: searchText)
    }
}

private extension LocationsViewModel {
    @MainActor
    func fetchLocations(isNewSearch: Bool = false, name: String? = nil) {
        Task {
            do {
                let newLocations = try await locationsDataSource.getLocations(isNewSearch: isNewSearch, name: name)
                locations.append(contentsOf: newLocations)
            } catch {
                print("Error when obtaining characters: \(error)")
            }
        }
    }
}
