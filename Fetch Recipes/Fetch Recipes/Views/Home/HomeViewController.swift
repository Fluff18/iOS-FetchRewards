//
//  HomeViewController.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/17/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var catogoryCollectionView: UICollectionView!
    
    
    var categories: [FoodCategory] = [.init(id: "1", name: "Sample0", image: "https://picsum.photos/100/200"),
                                      .init(id: "1", name: "Sample1", image: "https://picsum.photos/100/200"),
                                      .init(id: "1", name: "Sample2", image: "https://picsum.photos/100/200"),
                                      .init(id: "1", name: "Sample3", image: "https://picsum.photos/100/200"),
                                      .init(id: "1", name: "Sample4", image: "https://picsum.photos/100/200"),
                                      .init(id: "1", name: "Sample5", image: "https://picsum.photos/100/200")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor  = .lightGray
        
        catogoryCollectionView.delegate = self
        catogoryCollectionView.dataSource = self
        registerCells()
        
        
    }
    
    private func registerCells() {
        catogoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        cell.setup(category: categories[indexPath.row])
        return cell
    }
    
}
