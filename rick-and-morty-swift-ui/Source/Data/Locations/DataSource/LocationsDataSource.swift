//
//  LocationsDataSource.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 16/11/23.
//

import Foundation

protocol LocationsDataSource {
    func getLocations(isNewSearch: Bool, name: String?) async throws -> [LocationsModel]
}

extension LocationsDataSource {
    func getLocations(isNewSearch: Bool = false, name: String? = nil) async throws -> [LocationsModel] {
        try await getLocations(isNewSearch: isNewSearch, name: name)
    }
}

final class DefaultLocationsDataSource {
    private let networkManager: NetworkManager
    private var paginationInfo: AllLocationsModel.Info?
    
    init(networkManager: NetworkManager = DefaultNetworkManager()) {
        self.networkManager = networkManager
    }
    
}


//MARK: - EXTENSIONS

extension DefaultLocationsDataSource: LocationsDataSource {
    func getLocations(isNewSearch: Bool, name: String?) async throws -> [LocationsModel] {
        do {
            if isNewSearch {
                paginationInfo = nil
            }
            var url: URL?
            var parameters: [NetworkParameter] = []
            
            if let name, !name.isEmpty {
                paginationInfo = nil
                parameters.append(NetworkParameter(query: "name", value: name))
                url = NetworkURL(baseUrl: Constant.baseUrl, endpoint: .location, parameters: parameters).url
            } else {
                if let paginationInfo {
                    // We have pagination info
                    guard let nextUrl = paginationInfo.next else {
                        // Next page doesn't exists, because is the last, we no longer have to ask for more info
                        return []
                    }
                    url = URL(string: nextUrl)
                } else {
                    paginationInfo = nil
                    url = NetworkURL(baseUrl: Constant.baseUrl, endpoint: .location).url
                }
            }
            
            guard let url else {
                fatalError("Invalid URL")
            }
            let allLocationsModel: AllLocationsModel = try await networkManager.execute(url: url, httpMethod: .get)
            self.paginationInfo = allLocationsModel.info
            return allLocationsModel.results
        } catch {
            throw error
        }
    }
}
