//
//  Font.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 25/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import UIKit

extension UIFont {
    class func appUltraLightFont(size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-UltraLight", size: size) ?? UIFont.systemFontOfSize(size)
    }
    
    class func appRegularFont(size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Regular", size: size) ?? UIFont.systemFontOfSize(size)
    }
    
    class func appMediumFont(size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Medium", size: size) ?? UIFont.boldSystemFontOfSize(size)
    }
    
    class func appHeavyFont(size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Heavy", size: size) ?? UIFont.boldSystemFontOfSize(size)
    }
    
    class func appBoldFont(size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Bold", size: size) ?? UIFont.boldSystemFontOfSize(size)
    }
    
    class func appDemiBoldFont(size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-DemiBold", size: size) ?? UIFont.boldSystemFontOfSize(size)
    }
    
    class var appDefaultTextFontSize: CGFloat {
        return 17.0
    }
    
    class var appDefaultSmallTextFontSize: CGFloat {
        return 14.0
    }
}

extension UIFont {
    class func appUltraLightFont() -> UIFont {
        return appUltraLightFont(appDefaultTextFontSize)
    }
    
    class func appRegularFont() -> UIFont {
        return appRegularFont(appDefaultTextFontSize)
    }
    
    class func appMediumFont() -> UIFont {
        return appMediumFont(appDefaultTextFontSize)
    }
    
    class func appHeavyFont() -> UIFont {
        return appHeavyFont(appDefaultTextFontSize)
    }
    
    class func appBoldFont() -> UIFont {
        return appBoldFont(appDefaultTextFontSize)
    }
    
    class func appDemiBoldFont() -> UIFont {
        return appDemiBoldFont(appDefaultTextFontSize)
    }
}