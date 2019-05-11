//
//  ExtUIColor.swift
//  KitaMath
//
//  Created by AIA-Chris on 09/05/19.
//  Copyright © 2019 Chrizers. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    convenience init(rgb: Int, a: CGFloat = 1.0) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            a: a
        )
    }
}

extension String {
    func toInt() -> Int {
        return Int(self)!
    }
}

extension Int {
    func toString() -> String {
        return String(self)
    }
}


