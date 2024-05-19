//
//  RecipeModel.swift
//  flavorful
//
//  Created by Fatima Abdinli on 19.05.24.
//

import Foundation

struct RecipeModel: Codable {
    let results: [RecipeResult]?
    let offset, number, totalResults: Int?
}

// MARK: - Result
struct RecipeResult: Codable {
    let veryHealthy, cheap, veryPopular, sustainable, vegetarian, vegan, glutenFree, dairyFree: Bool?
    let lowFodmap: Bool?
    let weightWatcherSmartPoints: Int?
    let preparationMinutes, cookingMinutes, aggregateLikes, healthScore: Int?
    let creditsText: String?
    let license: String?
    let sourceName: String?
    let pricePerServing: Double?
    let id: Int?
    let title: String?
    let readyInMinutes, servings: Int?
    let sourceURL: String?
    let image: String?
    let imageType: String
    let summary: String?
    let cuisines: [String]?
    let dishTypes, diets: [String]?
    let spoonacularScore: Double?
    let spoonacularSourceURL: String?
}
