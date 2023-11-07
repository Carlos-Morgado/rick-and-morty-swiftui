//
//  CharactersModel.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 25/10/23.
//

import Foundation

struct CharacterModel: Decodable, Equatable {
    static func == (lhs: CharacterModel, rhs: CharacterModel) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: Int
    let name: String
    let status: CharacterStatusModel
    let species: String
    let type: String
    let gender: CharacterGenderModel
    let origin: CharacterOriginModel
    let location: CharacterLocationModel
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

