//
//  CategoryCollectionViewCell.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/17/22.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    func setup(category: FoodCategory) {
        categoryTitleLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image.asUrl)
    }
}
