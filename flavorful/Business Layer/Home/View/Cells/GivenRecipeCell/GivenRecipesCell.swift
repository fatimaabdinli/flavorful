//
//  GivenRecipesCell.swift
//  flavorful
//
//  Created by Fatima Abdinli on 18.05.24.
//

import UIKit

protocol GivenRecipeCellProtocol {
    var image: String {get}
    var name: String {get}
    var author: String {get}
    var time: String {get}
    var calorie: String {get}
}

class GivenRecipesCell: UICollectionViewCell {
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeAuthor: UILabel!
    @IBOutlet weak var recipeTime: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var recipeCalorie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
