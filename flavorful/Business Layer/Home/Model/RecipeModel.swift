//
//  RecipeModel.swift
//  flavorful
//
//  Created by Fatima Abdinli on 19.05.24.
//

import Foundation

// MARK: - RecipeModel
struct RecipeModel: Codable {
    let results: [RecipeResult]?
    let offset, number, totalResults: Int?
}

// MARK: - RecipeResult
struct RecipeResult: Codable {
    let vegetarian, vegan, glutenFree, dairyFree: Bool?
    let veryHealthy, cheap, veryPopular, sustainable: Bool?
    let lowFodmap: Bool?
    let weightWatcherSmartPoints: Int?
    let gaps: String?
    let preparationMinutes, cookingMinutes, aggregateLikes, healthScore: Int?
    let creditsText, sourceName: String?
    let pricePerServing: Double?
    let id: Int?
    let title: String?
    let readyInMinutes, servings: Int?
    let sourceURL: String?
    let image: String?
    let imageType: String?
    let summary: String?
    let cuisines: [String]?
    let dishTypes, diets: [String]?
    let occasions: [String]?
    let spoonacularScore: Double?
    let spoonacularSourceURL: String?
    let license: String?

//    enum CodingKeys: String, CodingKey {
//        case vegetarian, vegan, glutenFree, dairyFree, veryHealthy, cheap, veryPopular, sustainable, lowFodmap, weightWatcherSmartPoints, gaps, preparationMinutes, cookingMinutes, aggregateLikes, healthScore, creditsText, sourceName, pricePerServing, id, title, readyInMinutes, servings
//        case sourceURL = "sourceUrl"
//        case image, imageType, summary, cuisines, dishTypes, diets, occasions, spoonacularScore
//        case spoonacularSourceURL = "spoonacularSourceUrl"
//        case license
//    }
}

//MARK: GivenRecipeCellProtocol

extension RecipeResult: GivenRecipeCellProtocol {
    var imageURL: String {
        image ?? ""
    }
    
    var name: String {
        title ?? ""
    }
    
    var time: Int {
        readyInMinutes ?? 0
    }
    
    var score: Double {
        spoonacularScore ?? 0
    }
    
    var health: Int {
        healthScore ?? 0
    }
}
