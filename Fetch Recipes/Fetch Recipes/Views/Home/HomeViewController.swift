//
//  HomeViewController.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/17/22.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController, ObservableObject {

    @IBOutlet weak var catogoryCollectionView: UICollectionView!
    
    
    var categories: [Regions] = [.init(strArea: "12")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHUD.show()
        NetworkManager.shared.getRegions() { (result) in
            switch result {
            case .success(let data):
                print("The data after decoding is:\(data)")
                self.categories = data.map({ Regions.init(strArea: $0.strArea)})
                ProgressHUD.dismiss()
            case .failure(let error):
                print("The error is \(error.localizedDescription)")
                ProgressHUD.showError(error.localizedDescription)
            }
            self.categories.append(.init(strArea: "asdad"))
            print(self.categories)
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
