//
//  UIView+Extension.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/16/22.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
