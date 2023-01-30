//
//  UIViewController+Extension.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/25/22.
//

import Foundation
import UIKit

extension UIViewController {
    //return the name of the viewcontroller class
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier) as! Self
        return controller
    }
}
