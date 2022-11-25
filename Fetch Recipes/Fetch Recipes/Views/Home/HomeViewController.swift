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
    @IBOutlet weak var foodCategoryCollectionView: UICollectionView!
    
    lazy var categories: [Regions] = []
    lazy var foodcategories: [FoodCategory] = [(.init(idCategory: "asd", strCategory: "Asd", strCategoryThumb: "https://www.themealdb.com/images/category/lamb.png", strCategoryDescription: "asd"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        catogoryCollectionView.delegate = self
        catogoryCollectionView.dataSource = self
        
        foodCategoryCollectionView.delegate = self
        foodCategoryCollectionView.dataSource = self
        registerCells()
        setupCells()
    }

    private func setupCells() {
        NetworkManager.shared.getRegions() { (result) in
            switch result {
            case .success(let data):
                print("The data after decoding is:\(data)")
                self.categories = data.map({ Regions.init(strArea: $0.strArea)})
                self.catogoryCollectionView.reloadData()
                
            case .failure(let error):
                print("The error is \(error.localizedDescription)")
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        ProgressHUD.show()
        NetworkManager.shared.getFoodCategories() { (result)  in
            switch result {
            case .success(let data):
                print("The data after decoding is:\(data)")
                self.foodcategories = data.map({ FoodCategory.init(idCategory: $0.idCategory, strCategory: $0.strCategory, strCategoryThumb: $0.strCategoryThumb, strCategoryDescription: $0.strCategoryDescription)})
                self.foodCategoryCollectionView.reloadData()
                ProgressHUD.dismiss()
                
            case .failure(let error):
                print("The error is \(error.localizedDescription)")
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    private func registerCells() {
        catogoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        foodCategoryCollectionView.register(UINib(nibName: FoodCategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: FoodCategoryCollectionViewCell.identifier)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case foodCategoryCollectionView:
            return foodcategories.count
        case catogoryCollectionView:
            return categories.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case foodCategoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCategoryCollectionViewCell.identifier, for: indexPath) as! FoodCategoryCollectionViewCell
            cell.setup(foodcategory: foodcategories[indexPath.row])
            return cell
        case catogoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
       
    }
    
}
