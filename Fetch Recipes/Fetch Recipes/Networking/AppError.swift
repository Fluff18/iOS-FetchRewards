//
//  AppError.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/20/22.
//

import Foundation

enum AppError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidURLError
    case serverError(String)
    case  noData
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "Unknown Error"
        case .invalidURLError:
            return "Please enter the right URL"
        case .noData:
            return "No Data"
        case .serverError(let  error):
            return error
        }
    }
}
