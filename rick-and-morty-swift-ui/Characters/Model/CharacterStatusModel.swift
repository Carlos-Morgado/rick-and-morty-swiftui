//
//  CharacterStatusModel.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 25/10/23.
//

import Foundation

enum CharacterStatusModel: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    var localizedText: String {
        switch self {
        case .alive:
            return "character-status-alive-value-info".localized
        case .dead:
            return "character-status-dead-value-info".localized
        case .unknown:
            return "character-status-unknown-value-info".localized
        }
    }
}
