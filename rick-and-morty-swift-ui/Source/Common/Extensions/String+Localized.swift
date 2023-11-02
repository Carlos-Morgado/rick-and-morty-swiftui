//
//  String + Localized.swift
//  rick-and-morty-swift-ui
//
//  Created by Carlos Morgado on 25/10/23.
//

import SwiftUI

extension String {

  var localized: String {
    return NSLocalizedString(self, comment: "\(self)_comment")
  }
    
}
