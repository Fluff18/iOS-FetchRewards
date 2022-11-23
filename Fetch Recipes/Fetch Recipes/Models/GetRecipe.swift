//
//  GetRecipe.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/23/22.
//

import Foundation
struct GetRecipe: Decodable {
    let idMeal, strMeal, strCategory, strArea, strInstructions, strTags: String
    let strDrinkAlternate, strMealThumb, strYoutube, strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20, strSource, strImageSource, strCreativeCommonsConfirmed, dateModified: String?
}
