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
    fileprivate(set) var contentColor = UIColor.colorWithHexString("000000")
    
    func resetColor() {
       contentColor = UIColor.colorWithHexString("6F6F6F")
    }
    
    func updateColor(_ color: UIColor) {
        updateColor(color, isWithNotification: true)
    }
    
    func updateColor(_ color: UIColor, isWithNotification: Bool) {
        contentColor = color
        
        if isWithNotification {
            NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.kAZNotificationColorChanged), object: nil)
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
        return UIColor.black.withAlphaComponent(0.6)
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
    class func colorWithHexString(_ hex: String) -> UIColor {
      var hex = hex

      if hex.hasPrefix("#") {
        hex = hex.substring(from: 1)
      }

      if hex.characters.count == 3 {
        let redHex = hex.substring(with: 0..<1)
        let greenHex = hex.substring(with: 1..<2)
        let blueHex = hex.substring(with: 2..<3)

        hex = redHex + redHex + greenHex + greenHex + blueHex + blueHex
      }

      let redHex = hex.substring(with: 0..<2)
      let greenHex = hex.substring(with: 2..<4)
      let blueHex = hex.substring(with: 4..<6)

      var redInt: CUnsignedInt = 0
      var greenInt: CUnsignedInt = 0
      var blueInt: CUnsignedInt = 0

      Scanner(string: redHex).scanHexInt32(&redInt)
      Scanner(string: greenHex).scanHexInt32(&greenInt)
      Scanner(string: blueHex).scanHexInt32(&blueInt)

      return UIColor(red: CGFloat(redInt) / 255.0,
                green: CGFloat(greenInt) / 255.0,
                blue: CGFloat(blueInt) / 255.0,
                alpha: 1.0)
    }
}

extension String {
  func substring(from index: Int) -> String {
    return self.substring(from: self.characters.index(self.startIndex, offsetBy: index))
  }

  func substring(with range: Range<Int>) -> String {
    let startIndex = self.characters.index(self.startIndex, offsetBy: range.lowerBound)
    let endIndex = self.characters.index(self.startIndex, offsetBy: range.upperBound)
    return self.substring(with: startIndex..<endIndex)
  }
}

