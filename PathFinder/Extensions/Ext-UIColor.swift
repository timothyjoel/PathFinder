//
//  Ext-UIColor.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 11/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import UIKit

extension UIColor {
    
    class var flatBlack: UIColor {
        return UIColor(red: 43, green: 43, blue: 43)
    }
    
    class var background: UIColor {
        return UIColor(red: 243, green: 243, blue: 248)
    }
    
    class var mainColor: UIColor {
        return UIColor(red: 83, green: 86, blue: 176)
    }
    
    class var main2Color: UIColor {
        return UIColor(red: 176, green: 97, blue: 131)
    }
    
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
    
}


