//
//  HomeViewController.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/17/22.
//
import ProgressHUD
import UIKit
import ProgressHUD

class HomeViewController: UIViewController, ObservableObject {

    @IBOutlet weak var catogoryCollectionView: UICollectionView!
<<<<<<< HEAD
    @IBOutlet weak var foodCategoryCollectionView: UICollectionView!
    
    lazy var categories: [Regions] = []
    lazy var foodcategories: [FoodCategory] = [(.init(idCategory: "asd", strCategory: "Asd", strCategoryThumb: "https://www.themealdb.com/images/category/lamb.png", strCategoryDescription: "asd"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Fetch Recipes"
        
        catogoryCollectionView.delegate = self
        catogoryCollectionView.dataSource = self
=======
    @IBOutlet weak var ingredientsCollectionView: UICollectionView!
    @IBOutlet weak var areaCollectionView: UICollectionView!
    
    var categories: [FoodCategory] = [.init(idCategory: "1", strCategory: "Sample1", strCategoryThumb: "https://picsum.photos/100/200", strCategoryDescription: ""),
                                      .init(idCategory: "1", strCategory: "Sample2", strCategoryThumb: "https://picsum.photos/100/200", strCategoryDescription: ""),
                                      .init(idCategory: "1", strCategory: "Sample3", strCategoryThumb: "https://picsum.photos/100/200", strCategoryDescription: "Helo")]
    
    var ingredients: [Ingredient] = [.init(id: "1", ingredient: "Dessert", image: "https://www.themealdb.com/images/category/dessert.png"),
                                     .init(id: "1", ingredient: "Sample1", image: "https://picsum.photos/100/200"),
                                     .init(id: "1", ingredient: "Sample2", image: "https://picsum.photos/100/200"),
                                     .init(id: "1", ingredient: "Sample3", image: "https://picsum.photos/100/200"),
                                     .init(id: "1", ingredient: "Sample4", image: "https://picsum.photos/100/200"),
                                     .init(id: "1", ingredient: "Sample5", image: "https://picsum.photos/100/200")]
    
    var area: [Area] = [.init(id: "1", country: "Dessert", image: "https://www.themealdb.com/images/category/dessert.png"),
                        .init(id: "1", country: "Sample1", image: "https://picsum.photos/100/200"),
                        .init(id: "1", country: "Sample2", image: "https://picsum.photos/100/200"),
                        .init(id: "1", country: "Sample3", image: "https://picsum.photos/100/200"),
                        .init(id: "1", country: "Sample4", image: "https://picsum.photos/100/200"),
                        .init(id: "1", country: "Sample5", image: "https://picsum.photos/100/200")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHUD.show()
        NetworkManager.shared.fetchDesert { (result) in
            switch result {
            case .success(let data):
                print("The data is \(data)")
                ProgressHUD.dismiss()
            case .failure(let error):
                print("The error is \(error.localizedDescription)")
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
        catogoryCollectionView.delegate = self
        catogoryCollectionView.dataSource = self
        ingredientsCollectionView.dataSource = self
        ingredientsCollectionView.delegate = self
        areaCollectionView.delegate = self
        areaCollectionView.dataSource = self
        
        
        registerCells()
        
>>>>>>> master
        
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
        
<<<<<<< HEAD
        foodCategoryCollectionView.register(UINib(nibName: FoodCategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: FoodCategoryCollectionViewCell.identifier)
=======
        ingredientsCollectionView.register(UINib(nibName: IngredientCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: IngredientCollectionViewCell.identifier)
        
        areaCollectionView.register(UINib(nibName: AreaCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: AreaCollectionViewCell.identifier)
>>>>>>> master
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
<<<<<<< HEAD
        case foodCategoryCollectionView:
            return foodcategories.count
        case catogoryCollectionView:
            return categories.count
=======
        case catogoryCollectionView:
            return categories.count
        case ingredientsCollectionView:
            return ingredients.count
        case areaCollectionView:
            return area.count
>>>>>>> master
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
<<<<<<< HEAD
        
        switch collectionView {
        case foodCategoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCategoryCollectionViewCell.identifier, for: indexPath) as! FoodCategoryCollectionViewCell
            cell.setup(foodcategory: foodcategories[indexPath.row])
            return cell
=======
        switch collectionView {
>>>>>>> master
        case catogoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
<<<<<<< HEAD
        default:
            return UICollectionViewCell()
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == catogoryCollectionView {
            
        } else {
            let controller = AllDishes.instantiate()
            controller.selectedCategory = foodcategories[indexPath.row]
            navigationController?.present(controller, animated: true, completion: nil)
        }
=======
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
        
>>>>>>> master
    }
    
}
