//
//  EpisodeTypeInfo.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 16/11/23.
//

import Foundation

enum EpisodeTypeInfo: CaseIterable {
    case name
    case airDate
    case episode
    
    var localizedText: String {
        switch self {
        case .name:
            return "episode_name_type_info".localized
        case .airDate:
            return "episode_airDate_type_info".localized
        case .episode:
            return "episode_episodeCode_type_info".localized
        
        }
    }
}
