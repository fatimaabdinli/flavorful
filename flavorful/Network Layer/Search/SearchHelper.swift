//
//  SearchHelper.swift
//  flavorful
//
//  Created by Fatima Abdinli on 27.05.24.
//

import Foundation

enum SearchHelper: String {
    case recipeSearch = "/complexSearch"

    var path: String {
        return NetworkHelper.shared.requestURL(url: self.rawValue)
    }
}
