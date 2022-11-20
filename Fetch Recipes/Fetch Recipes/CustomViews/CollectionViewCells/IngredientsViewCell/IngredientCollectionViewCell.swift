//
//  IngredientCollectionViewCell.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/17/22.
//

import UIKit

class IngredientCollectionViewCell: UICollectionViewCell {

    static let identifier = "IngredientCollectionViewCell"
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var imageLabel: UIImageView!
    
    func setup(ing: Ingredient) {
        titleLabel.text = ing.ingredient
        imageLabel.kf.setImage(with: ing.image?.asUrl)
        
    }
}
