//
//  EpisodesDataSource.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 13/11/23.
//

import Foundation

enum EpisodeDataSourceError: Error {
    case invalidUrl
}

protocol EpisodesDataSource {
    func getEpisodes(isNewSearch: Bool, name: String?) async throws -> [EpisodeModel]
    func getEpisodeDetail(urlString: String) async throws -> EpisodeModel
}

extension EpisodesDataSource {
    func getEpisodes(isNewSearch: Bool = false, name: String? = nil) async throws -> [EpisodeModel] {
        try await getEpisodes(isNewSearch: isNewSearch, name: name)
    }
}

final class DefaultEpisodesDataSource {
    private let networkManager: NetworkManager
    private var paginationInfo: AllEpisodesModel.Info?
    
    init(networkManager: NetworkManager = DefaultNetworkManager()) {
        self.networkManager = networkManager
    }
}

extension DefaultEpisodesDataSource: EpisodesDataSource {
    
    func getEpisodes(isNewSearch: Bool, name: String?) async throws -> [EpisodeModel] {
        do {
            if isNewSearch {
                paginationInfo = nil
            }
            var url: URL?
            var parameters: [NetworkParameter] = []
            
            if let name, !name.isEmpty {
                paginationInfo = nil
                parameters.append(NetworkParameter(query: "name", value: name))
                url = NetworkURL(baseUrl: Constant.baseUrl, endpoint: .episode, parameters: parameters).url
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
                    url = NetworkURL(baseUrl: Constant.baseUrl, endpoint: .episode).url
                }
            }
            
            guard let url else {
                fatalError("Invalid URL")
            }
            let allEpisodesModel: AllEpisodesModel = try await networkManager.execute(url: url, httpMethod: .get)
            self.paginationInfo = allEpisodesModel.info
            return allEpisodesModel.results
        } catch {
            throw error
        }
    }
    
    func getEpisodeDetail(urlString: String) async throws -> EpisodeModel {
        do {
            guard let episodeDetailUrl = URL(string: urlString) else {
                fatalError("Invalid URL")
            }
            let episodeModel: EpisodeModel = try await networkManager.execute(url: episodeDetailUrl, httpMethod: .get)
            return episodeModel
        } catch {
            throw error
        }
        
    }
}
