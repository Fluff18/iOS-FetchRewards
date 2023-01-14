//
//  Route.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/20/22.
//

import Foundation

enum Route {
    static let baseUrl = "https://www.themealdb.com/"
    
    case categories
    case dessert
    var description: String {
        switch self {
        case .categories: return "api/json/v1/1/categories.php"
        case .dessert: return "api/json/v1/1/filter.php?c=Dessert"
            
        }
    }
}
