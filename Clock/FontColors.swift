//
//  FontColors.swift
//  Clock

//  Created by Kristina Neuwirth on 7/18/18.
//  Copyright © 2018 Kristina Neuwirth. All rights reserved.


import UIKit

extension UIColor {

    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {

        self.init(
            red : CGFloat(red) / 255.0,
            green : CGFloat(green) / 255.0,
            blue : CGFloat(blue) / 255.0,
            alpha : a
        )

    }

    convenience init(hex: Int, a: CGFloat = 1.0) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue : hex & 0xFF

            )

        }
        
//        func updateFontColor(hex: String) {
//            switch hex {
//            case "red":
//                topView.alpha = 1
//                topLeftview.alpha = 1
//                topRightView.alpha = 1
//                bottomLeftView.alpha = 1
//                bottomRightView.alpha = 1
//                bottomView.alpha = 1
//
//            }
//        }
    
}
