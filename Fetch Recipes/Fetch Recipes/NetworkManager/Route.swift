//
//  Route.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/22/22.
//

import Foundation

enum Route {
    static let baseUrl = "https://www.themealdb.com/api/"
    
    case region
    case deserts
    case dessertRecipe
    case foodCategories
    case listFood
    
    var description: String {
        switch self {
        case .region:
            return "json/v1/1/list.php?a=list"
        case .deserts:
            return "json/v1/1/filter.php?c=Dessert"
        case .dessertRecipe:
            return "json/v1/1/lookup.php?i="
        case .foodCategories:
            return "json/v1/1/categories.php"
        case .listFood:
            return "json/v1/1/filter.php?c="
        }
    }
}
