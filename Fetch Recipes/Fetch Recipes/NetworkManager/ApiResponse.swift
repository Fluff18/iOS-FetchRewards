//
//  ApiResponse.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/22/22.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let meals: T?
    let categories: T?
    let error: String?
}
