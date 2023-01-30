//
//  AllDishesTableViewCell.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/25/22.
//

import UIKit

class AllDishesTableViewCell: UITableViewCell {

    @IBOutlet weak var tableTitleView: UILabel!
    @IBOutlet weak var tatbleImageView: UIImageView!
    
    static let identifier = String(describing: AllDishesTableViewCell.self)
    
    
    func setup(dish: AllDesserts) {
        tableTitleView.text = dish.strMeal
        tatbleImageView.kf.setImage(with: dish.strMealThumb?.asUrl)
    }
}
