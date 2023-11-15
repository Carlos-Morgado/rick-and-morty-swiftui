//
//  AllEpisodesModel.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 13/11/23.
//

import Foundation


struct AllEpisodesModel: Decodable {
    struct Info: Decodable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [EpisodeModel]
}
