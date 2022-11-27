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
    @IBOutlet weak var IngredientsTitle: UILabel!
    
    var selectedRecipe: GetRecipe!
    var AllIngredients = [Any]()
    var AllMeasures = [Any]()
    var IngMeasure = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCells()
        print("RAHUL")
    }
    
    
    func setupCells() {
        NetworkManager.shared.getRecipe(endPoint: "53032") { [self] (result) in
            switch result {
            case .success(let data):
                print("The data after decoding is:\(data)")
                
                self.RecipeImageView.kf.setImage(with: data[0].strMealThumb?.asUrl)
                self.RecipeInstructionsView.text = data[0].strInstructions
                self.MealTitle.text = data[0].strMeal
                self.tagTitle.text = data[0].strTags
                
                let mirror = Mirror(reflecting: data[0])
                for child in mirror.children {
                    let childLabelString = child.label!
                    if(child.value as? String !=  nil) {
                        let childValueString = child.value as? String
                        let trimmed = childValueString?.trimmingCharacters(in: .whitespacesAndNewlines)
                        if(trimmed != "") {
                            if (childLabelString.starts(with: "strIngredient")) {
                                self.AllIngredients.append(child.value)
                            }
                            if (childLabelString.starts(with: "strMeasure")) {
                                self.AllMeasures.append(child.value)
                            }
                        }
                    }
                }
                
                for (i, j) in zip(self.AllIngredients, self.AllMeasures) {
                    let i1 = i as? String
                    let i2 = i1!
                    let j1 = j as? String
                    let j2 = j1!
                    print(i2, j2)
                    IngMeasure = IngMeasure + "\(i2)  " + "\(j2)" + "\r\n\r\n"
                }
                self.IngredientsTitle.text = IngMeasure
                
            case .failure(let error):
                print("The error is \(error.localizedDescription)")
            }
        }
    }
}

