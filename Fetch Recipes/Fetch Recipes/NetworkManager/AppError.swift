//
//  AppError.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/22/22.
//

import Foundation

enum AppError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case internalServerError(String)
    case noData
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "Unknown URL"
        case .invalidUrl:
            return "Please enter valid URL"
        case .internalServerError(let error):
            return error
        case .noData:
            return "No data"
        }
    }
}
