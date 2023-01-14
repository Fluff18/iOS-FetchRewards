//
//  AreaCollectionViewCell.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/17/22.
//

import UIKit

class AreaCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: AreaCollectionViewCell.self)
    @IBOutlet weak var areaImageView: UIImageView!
    @IBOutlet weak var areaTitleLabel: UILabel!
    
    func setup(area: Area) {
        areaImageView.kf.setImage(with: area.image?.asUrl)
        areaTitleLabel.text = area.country
    }

}
