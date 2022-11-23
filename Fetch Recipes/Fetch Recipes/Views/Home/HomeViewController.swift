//
//  HomeViewController.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/17/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var catogoryCollectionView: UICollectionView!
    
    
    var categories: [FoodCategory] = [.init(id: "1", name: "Sample0"),
                                      .init(id: "1", name: "Sample1"),
                                      .init(id: "1", name: "Sample2"),
                                      .init(id: "1", name: "Sample3"),
                                      .init(id: "1", name: "Sample4"),
                                      .init(id: "1", name: "Sample5")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.getRegions() { (result) in
            switch result {
            case .success(let data):
                print("The data after decoding is:\(data)")
            case .failure(let error):
                print("The error is \(error.localizedDescription)")
            }
        }
        
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
