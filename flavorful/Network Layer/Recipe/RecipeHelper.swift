//
//  RecipeHelper.swift
//  NetworkProject
//
//  Created by Fatima Abdinli on 19.05.24.
//

import Foundation

enum RecipeHelper: String {
    case recipeSearch = "/complexSearch"

    var path: String {
        return NetworkHelper.shared.requestURL(url: self.rawValue)
    }
}
