//
//  ApiSturct.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/20/22.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status:  Int
    let message: String?
    let data: T?
    let error: String?
}
