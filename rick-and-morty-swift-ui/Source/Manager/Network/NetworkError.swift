//
//  NetworkError.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 26/10/23.
//

import Foundation

enum NetworkError: Error {
    
    case requestError(Error)
    case invalidResponse
    case invalidStatusCode(Int)
    case invalidData
    
}
