//
//  RecipeCell.swift
//  flavorful
//
//  Created by Fatima Abdinli on 08.05.24.
//

import UIKit

protocol RecipeCellProtocol {
    var id: String {get}
    var image: String {get}
    var titleLabel: String {get}
    var subtitleLabel: String {get}
}

class RecipeCell: UICollectionViewCell {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descr: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    fileprivate func setupView() {
        image.layer.cornerRadius = image.frame.width / 2
        image.layer.borderWidth = 0.5
        image.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.layer.cornerRadius = 12
    }

    func configureCell(model: RecipeCellProtocol) {
        title.text = model.titleLabel
        descr.text = model.subtitleLabel
        image.image = UIImage(named: model.image)
    }
}
