//
//  DDColorHex.swift
//  DDLC
//
//  Created by ... on 2019/3/25.
//  Copyright © 2019 .... All rights reserved.
//

import UIKit

extension UIColor {
    
    open class func colorHex(_ hexValue: Int) -> UIColor {
        return colorAlphaHex(hexValue, alpha: 1.0)
    }
    
    open class func colorAlphaHex(_ hexValue: Int, alpha: CGFloat) -> UIColor {
        let red = (hexValue & 0xFF0000) >> 16
        let green = (hexValue & 0xFF00) >> 16
        let blue = (hexValue & 0xFF) >> 16
        return UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: alpha)
    }
    
    open class func colorHexStr(_ hexStr: String) -> UIColor {
        // 去除空格
        var colorStr : String = hexStr.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        if colorStr.hasPrefix("#") {
            let index = colorStr.index(after: colorStr.startIndex)
            colorStr = String(colorStr[index...])
        }
        
        if colorStr.count != 6 {
            return .white
        }
        
        let rRange = colorStr.startIndex ..< colorStr.index(colorStr.startIndex, offsetBy: 2)
        let rStr = String(colorStr[rRange])
        
        let gRange = colorStr.index(colorStr.startIndex, offsetBy: 2) ..< colorStr.index(colorStr.startIndex, offsetBy: 4)
        let gStr = String(colorStr[gRange])
        
        let bIndex = colorStr.index(colorStr.endIndex, offsetBy: -2)
        let bStr = String(colorStr[bIndex...])
        
        var red: UInt32 = 0, green: UInt32 = 0, blue: UInt32 = 0
        // 分别转换进行转换
        Scanner(string: rStr).scanHexInt32(&red)
        Scanner(string: gStr).scanHexInt32(&green)
        Scanner(string: bStr).scanHexInt32(&blue)
        
        return UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
    }
}
