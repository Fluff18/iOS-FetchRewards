//
//  OnboardingViewController.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/16/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    
    var slide: [OnboardingSlide] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        slide = [OnboardingSlide(title: "Find everyday cooking Inspiration", description: "Welcome to Fetch Recipes!", image: UIImage(named: "Food")!),
                 OnboardingSlide(title: "Become World-Class Chefs", description: "Let's get started!", image: UIImage(named: "Food2")!)]
    }
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
    }
    

}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slide.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.idnetifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slide[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}


