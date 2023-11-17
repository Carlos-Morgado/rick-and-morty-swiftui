//
//  LocationsModel.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 16/11/23.
//

import Foundation

struct LocationsModel: Decodable, Equatable {
    static func == (lhs: LocationsModel, rhs: LocationsModel) -> Bool {
        lhs.id == rhs.id
    }
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
