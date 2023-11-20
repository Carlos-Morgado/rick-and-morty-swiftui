//
//  LocationDetailViewModel.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 17/11/23.
//

import Foundation

final class LocationDetailViewModel: ObservableObject {
    @Published var location: LocationsModel
    @Published var residents: [CharacterModel] = []
    
    private let charactersDataSource: CharacterDataSource = DefaultCharacterDataSource()
    
    init(location: LocationsModel) {
        self.location = location
    }
    
    @MainActor
    func onAppear() {
        fetchCharacters()
    }
    
    func getInfoCellValue(infoType: LocationTypeInfo) -> String {
        var value: String = ""
        switch infoType {
        case .name:
            value = location.name
        case .type:
            value = location.type
        case .dimension:
            value = location.dimension
        }
        
        return value
    }
}

private extension LocationDetailViewModel {
    
    @MainActor
    func fetchCharacters() {
        for url in location.residents {
            Task {
                do {
                    let characterModel = try await charactersDataSource.getCharacterDetail(urlString: url)
                    residents.append(characterModel)
                    residents.sort {$0.id < $1.id}
                } catch {
                    print("Error getting character episode: \(error)")
                }
            }
            
        }
    }
}
