//
//  CategoryRecipe.swift
//  flavorful
//
//  Created by Fatima Abdinli on 12.05.24.
//

import Foundation

struct CategoryRecipe: RecipeCellProtocol {
    var image: String {
        imageView ?? ""
    }
    var titleLabel: String {
        name ?? ""
    }
    var subtitleLabel: String {
        text ?? ""
    }
    
    var id: String?
    var name: String?
    var imageView: String?
    var text: String?
}

