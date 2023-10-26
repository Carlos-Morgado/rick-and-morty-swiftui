//
//  CharacterGenderModel.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 25/10/23.
//

import Foundation

enum CharacterGenderModel: String, Decodable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "unknown"
    
    var localizedText: String {
        switch self {
        case .male:
            return "character-gender-male-value-info".localized
        case .female:
            return "character-gender-female-value-info".localized
        case .genderless:
            return "character-gender-genderless-value-info".localized
        case .unknown:
            return "character-gender-unknown-value-info".localized
        }
    }
}
