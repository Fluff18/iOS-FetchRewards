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
    var currentPage = 0 {
        didSet {
            if currentPage == slide.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            }
            else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        slide = [OnboardingSlide(title: "Find everyday cooking Inspiration", description: "Welcome to Fetch Recipes!", image: UIImage(named: "Food")!),
                 OnboardingSlide(title: "Lets get started, Chef!", description: "ANYONE CAN COOK", image: UIImage(named: "Food2")!)]
        pageControl.numberOfPages = slide.count
    }
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        if(currentPage == slide.count - 1) {
            let controller = storyboard?.instantiateViewController(identifier: "HomeNavigationController") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        }
        
        else {
                currentPage = 1
                let indexPath = IndexPath(item: currentPage, section: 0)
                collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
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
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x/width)
        pageControl.currentPage = currentPage
    }
}


