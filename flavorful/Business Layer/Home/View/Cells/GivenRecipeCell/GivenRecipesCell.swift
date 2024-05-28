//
//  GivenRecipesCell.swift
//  flavorful
//
//  Created by Fatima Abdinli on 18.05.24.
//

import UIKit

protocol GivenRecipeCellProtocol {
    var imageURL: String {get}
    var name: String {get}
    var time: Int {get}
    var score: Double {get}
    var health: Int {get}
}

class GivenRecipesCell: UICollectionViewCell {
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeTime: UILabel!
    @IBOutlet weak var recipeScore: UILabel!
    @IBOutlet weak var healthScore: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var view: UIView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    fileprivate func setupView() {
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        recipeName.textColor = UIColor.white
        recipeTime.textColor = UIColor.white
        healthScore.textColor = UIColor.white
        recipeScore.textColor = UIColor.white
        recipeScore.layer.masksToBounds = true
        recipeScore.layer.cornerRadius = 28
        recipeImage.layer.cornerRadius = 16
        view.layer.cornerRadius = 16
    }
    
    func configureCell(model: GivenRecipeCellProtocol) {
        recipeName.text = model.name
        recipeTime.text = "\(String(model.time)) min"
        recipeScore.text = "Score\n\(String(Int(model.score)))"
        healthScore.text = "Health Score: \(String(model.health))"
        recipeImage.loadURL(model.imageURL)
    }
}
