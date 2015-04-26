//
//  Color.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 25/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import UIKit

let appColor = AZColor()

class AZColor {
    private(set) var contentColor = UIColor.colorWithHexString("000000")
    
    func resetColor() {
       contentColor = UIColor.colorWithHexString("6F6F6F")
    }
    
    func updateColor(color: UIColor) {
        updateColor(color, isWithNotification: true)
    }
    
    func updateColor(color: UIColor, isWithNotification: Bool) {
        contentColor = color
        
        if isWithNotification {
            NSNotificationCenter.defaultCenter().postNotificationName(Constants.kAZNotificationColorChanged, object: nil)
        }
    }
}

// MARK: - Background Colors
extension UIColor {
    /** Example: navigation bar color */
    class var backgroundColor: UIColor {
        return UIColor.colorWithHexString("FFFFFF")
    }
    
    /** Example: view background color */
    class var backgroundCustomColor: UIColor {
        return UIColor.colorWithHexString("FFFFFF")
    }
    
    /** Example: navigation bar elements color */
    class var backgroundElementsColor: UIColor {
        return UIColor.colorWithHexString("000000")
    }
}

// MARK: - Content Colors
extension UIColor {
    /** Example: cell background color */
    class var contentBackgroundColor: UIColor {
        return UIColor.colorWithHexString("FFFFFF")
    }
    
    /** Example: name color */
    class var contentElementsColor: UIColor {
        return appColor.contentColor
    }
    
    /** Example: info color */
    class var contentAdditionalElementsColor: UIColor {
        return UIColor.blackColor().colorWithAlphaComponent(0.6)
    }
    
    class var contentSeperatorsColor: UIColor {
        return appColor.contentColor
    }
    
    class var contentSeperatorsSelectionColor: UIColor {
        return UIColor.colorWithHexString("F3F3F3")
    }
    
}

// MARK: - From hex string
extension UIColor {
    class func colorWithHexString(hex: String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = cString.substringFromIndex(advance(cString.startIndex, 1))
        }
        
        if (count(cString) != 6) {
            return UIColor.grayColor()
        }
        
        var rString = cString.substringToIndex(advance(cString.startIndex, 2))
        var gString = cString.substringFromIndex(advance(cString.startIndex, 2)).substringToIndex(advance(cString.startIndex, 2))
        var bString = cString.substringFromIndex(advance(cString.startIndex, 4)).substringToIndex(advance(cString.startIndex, 2))
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1.0)
    }
}
