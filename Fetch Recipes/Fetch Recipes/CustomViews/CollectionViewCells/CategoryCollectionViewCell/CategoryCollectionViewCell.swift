//
//  CategoryCollectionViewCell.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/17/22.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    func setup(category: FoodCategory) {
//        categoryTitleLabel.text = category.strCategory
//        categoryImageView.kf.setImage(with: category.strCategoryThumb?.asUrl)
    }
}
