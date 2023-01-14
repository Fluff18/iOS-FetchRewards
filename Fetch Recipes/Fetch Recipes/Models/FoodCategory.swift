//
//  FoodCategory.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/17/22.
//

import Foundation

<<<<<<< HEAD
struct FoodCategory: Decodable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String?
    let strCategoryDescription: String?
=======
struct FoodCategory: Codable {
    let idCategory, strCategory, strCategoryThumb, strCategoryDescription: String?
>>>>>>> master
}
