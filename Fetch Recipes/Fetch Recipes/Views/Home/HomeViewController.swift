//
//  HomeViewController.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/17/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var catogoryCollectionView: UICollectionView!
    @IBOutlet weak var ingredientsCollectionView: UICollectionView!
    @IBOutlet weak var areaCollectionView: UICollectionView!
    
    var categories: [FoodCategory] = [.init(id: "1", name: "Sample0", image: "https://picsum.photos/100/200"),
                                      .init(id: "1", name: "Sample1", image: "https://picsum.photos/100/200"),
                                      .init(id: "1", name: "Sample2", image: "https://picsum.photos/100/200"),
                                      .init(id: "1", name: "Sample3", image: "https://picsum.photos/100/200"),
                                      .init(id: "1", name: "Sample4", image: "https://picsum.photos/100/200"),
                                      .init(id: "1", name: "Sample5", image: "https://picsum.photos/100/200")]
    
    var ingredients: [Ingredient] = [.init(id: "1", ingredient: "Sample0", image: "https://picsum.photos/100/200"),
                                     .init(id: "1", ingredient: "Sample1", image: "https://picsum.photos/100/200"),
                                     .init(id: "1", ingredient: "Sample2", image: "https://picsum.photos/100/200"),
                                     .init(id: "1", ingredient: "Sample3", image: "https://picsum.photos/100/200"),
                                     .init(id: "1", ingredient: "Sample4", image: "https://picsum.photos/100/200"),
                                     .init(id: "1", ingredient: "Sample5", image: "https://picsum.photos/100/200")]
    
    var area: [Area] = [.init(id: "1", country: "Sample0", image: "https://picsum.photos/100/200"),
                        .init(id: "1", country: "Sample1", image: "https://picsum.photos/100/200"),
                        .init(id: "1", country: "Sample2", image: "https://picsum.photos/100/200"),
                        .init(id: "1", country: "Sample3", image: "https://picsum.photos/100/200"),
                        .init(id: "1", country: "Sample4", image: "https://picsum.photos/100/200"),
                        .init(id: "1", country: "Sample5", image: "https://picsum.photos/100/200")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor  = .lightGray
        NetworkManager.shared.trialRequest { (result) in
            switch result {
            case .success(let data):
                print("The data is \(data)")
            case .failure(let error):
                print("The error is \(error.localizedDescription)")
            }
        }
        
        
        catogoryCollectionView.delegate = self
        catogoryCollectionView.dataSource = self
        ingredientsCollectionView.dataSource = self
        ingredientsCollectionView.delegate = self
        areaCollectionView.delegate = self
        areaCollectionView.dataSource = self
        
        
        registerCells()
        
        
    }
    
    private func registerCells() {
        catogoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        ingredientsCollectionView.register(UINib(nibName: IngredientCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: IngredientCollectionViewCell.identifier)
        
        areaCollectionView.register(UINib(nibName: AreaCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: AreaCollectionViewCell.identifier)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case catogoryCollectionView:
            return categories.count
        case ingredientsCollectionView:
            return ingredients.count
        case areaCollectionView:
            return area.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case catogoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case ingredientsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IngredientCollectionViewCell.identifier, for: indexPath) as! IngredientCollectionViewCell
            cell.setup(ing: ingredients[indexPath.row])
            return cell
        case areaCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AreaCollectionViewCell.identifier, for: indexPath) as! AreaCollectionViewCell
            cell.setup(area: area[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    
}
