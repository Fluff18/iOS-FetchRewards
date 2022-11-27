//
//  Recipe.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/25/22.
//
import UIKit
import Foundation
class RecipeViewController: UIViewController {
    
    @IBOutlet weak var RecipeInstructionsView: UILabel!
    @IBOutlet weak var MealTitle: UILabel!
    @IBOutlet weak var RecipeImageView: UIImageView!
    @IBOutlet weak var tagTitle: UILabel!
    
    var selectedRecipe: GetRecipe!
    var AllIngredients = [Any]()
    var AllMeasures = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCells()
        print("RAHUL")
    }
    
    
    func setupCells() {
        NetworkManager.shared.getRecipe(endPoint: "52772") { [self] (result) in
            switch result {
            case .success(let data):
                print("The data after decoding is:\(data)")
                
                self.RecipeImageView.kf.setImage(with: data[0].strMealThumb?.asUrl)
                self.RecipeInstructionsView.text = data[0].strInstructions
                self.MealTitle.text = data[0].strMeal
                self.tagTitle.text = data[0].strTags
                
                let mirror = Mirror(reflecting: data[0])
                print(mirror)
                for child in mirror.children {
                    let childLabelString = child.label!
                    if (childLabelString.starts(with: "strIngredient")) {
                        if(child.value != nil) {
                            self.AllIngredients.append(child.value)
                        }
                    }
                    if (childLabelString.starts(with: "strMeasure")) {
                        if(child.value != nil) {
                            self.AllMeasures.append(child.value)
                        }
                    }
                }
                print(self.AllMeasures, self.AllIngredients)
                
            case .failure(let error):
                print("The error is \(error.localizedDescription)")
            }
        }
    }
}

