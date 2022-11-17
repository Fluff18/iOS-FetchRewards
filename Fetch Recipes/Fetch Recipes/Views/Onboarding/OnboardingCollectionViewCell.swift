//
//  OnboardingCollectionViewCell.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/16/22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let idnetifier = String(describing: OnboardingCollectionViewCell.self)
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideDescriptionLabel.text = slide.description
        slideTitleLabel.text = slide.title
    }
}
