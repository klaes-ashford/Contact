//
//  UIColor+Extension.swift
//  Contact
//
//  Created by Kuliza-148 on 17/02/19.
//  Copyright © 2019 swift. All rights reserved.
//

import UIKit

extension UIColor {

    static func colorFromHexString(_ hexString : String) -> UIColor {
        let hexString:NSString = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) as NSString

        let scanner = Scanner(string: hexString as String)

        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }

        var color:UInt32 = 0
        scanner.scanHexInt32(&color)

        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask

        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0

        return self.init(red:red, green:green, blue:blue, alpha:1)
    }

    static func tundora() -> UIColor {
        return self.colorFromHexString("4A4A4A")
    }

    static func turquoise() -> UIColor {
        return self.colorFromHexString("50E3C2")
    }

}
