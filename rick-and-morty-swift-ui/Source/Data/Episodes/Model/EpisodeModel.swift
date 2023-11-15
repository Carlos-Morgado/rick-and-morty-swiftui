//
//  EpisodeModel.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 13/11/23.
//

import Foundation

struct EpisodeModel: Decodable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode
        case characters
        case url
        case created
    }
}
