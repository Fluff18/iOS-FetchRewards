//
//  String+Extension.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/17/22.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
