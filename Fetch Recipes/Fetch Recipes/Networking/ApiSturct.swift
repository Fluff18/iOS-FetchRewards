//
//  ApiSturct.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/20/22.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let strMeal, strMealThumb, idMeal: String?
}
