//
//  FoodCategoryCollectionViewCell.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/23/22.
//

import UIKit

class FoodCategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: FoodCategoryCollectionViewCell.self)
    
    @IBOutlet weak var FoodCategoryTitle: UILabel!
    @IBOutlet weak var FoodCategoryImage: UIImageView!
    
    func setup(foodcategory: FoodCategory) {
        FoodCategoryTitle.text = foodcategory.strCategory
//        FoodCategoryImage.kf.setImage(with: foodcategory.strCategoryThumb?.asUrl)
    }
    
}
