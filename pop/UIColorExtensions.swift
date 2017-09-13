//
//  UIColorExtensions.swift
//  pop
//
//  Created by Thales Frigo on 13/09/17.
//  Copyright © 2017 Thales Frigo. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: 1.0)
    }
    
    struct Pallete {
        static let available = UIColor(red: 116, green: 6, blue: 211)
        static let unavailable = UIColor(red: 183, green: 11, blue: 11)
    }
}
