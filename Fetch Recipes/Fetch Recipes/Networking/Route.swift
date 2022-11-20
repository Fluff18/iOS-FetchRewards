//
//  Route.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/20/22.
//

import Foundation

enum Route {
    static let baseUrl = "https://www.themealdb.com/"
    
    case temp
    var description: String {
        switch self {
        case.temp: return "api/json/v1/1/random.php"
        }
    }
}
