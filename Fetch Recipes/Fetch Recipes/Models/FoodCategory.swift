//
//  FoodCategory.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/17/22.
//

import Foundation

struct FoodCategory: Decodable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String?
    let strCategoryDescription: String?
}
