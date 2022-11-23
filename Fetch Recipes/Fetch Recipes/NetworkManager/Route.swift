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
    case dessert_recipe
    
    var description: String {
        switch self {
        case .region:
            return "json/v1/1/list.php?a=list"
        case .deserts:
            return "json/v1/1/filter.php?c=Dessert"
        case .dessert_recipe:
            return "json/v1/1/lookup.php?i="
        }
    }
}
