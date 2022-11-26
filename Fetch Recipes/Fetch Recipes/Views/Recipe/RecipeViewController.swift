//
//  Recipe.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/25/22.
//
import UIKit
import Foundation
class RecipeViewController: UIViewController {
    
    var selectedRecipe: GetRecipe!
    @IBOutlet weak var RecipeImage: UIImageView!
    var Recipes: [GetRecipe] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCells()
        print("RAHUL")
    }

    
    func setupCells() {
        NetworkManager.shared.getRecipe(endPoint: "52772") { (result) in
            switch result {
            case .success(let data):
                print("The data after decoding is:\(data)")
                self.Recipes = data.map({ GetRecipe.init(idMeal: $0.idMeal, strMeal: $0.strMeal, strCategory: $0.strCategory, strArea: $0.strArea, strInstructions: $0.strInstructions, strTags: $0.strTags, strDrinkAlternate: $0.strDrinkAlternate, strMealThumb: $0.strMealThumb, strYoutube: $0.strYoutube, strIngredient1: $0.strIngredient1, strIngredient2: $0.strIngredient2, strIngredient3: $0.strIngredient3, strIngredient4: $0.strIngredient4, strIngredient5: $0.strIngredient5, strIngredient6: $0.strIngredient6, strIngredient7: $0.strIngredient7, strIngredient8: $0.strIngredient8, strIngredient9: $0.strIngredient9, strIngredient10: $0.strIngredient10, strIngredient11: $0.strIngredient11, strIngredient12: $0.strIngredient12, strIngredient13: $0.strIngredient13, strIngredient14: $0.strIngredient14, strIngredient15: $0.strIngredient15, strIngredient16: $0.strIngredient16, strIngredient17: $0.strIngredient17, strIngredient18: $0.strIngredient18, strIngredient19: $0.strIngredient19, strIngredient20: $0.strIngredient20, strSource: $0.strSource, strImageSource: $0.strImageSource, strCreativeCommonsConfirmed: $0.strCreativeCommonsConfirmed, dateModified: $0.dateModified)})
                
            case .failure(let error):
                print("The error is \(error.localizedDescription)")
            }
        }
    }
}

