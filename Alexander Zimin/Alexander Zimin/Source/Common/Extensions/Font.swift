//
//  Font.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 25/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import UIKit

extension UIFont {
    class func appUltraLightFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-UltraLight", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func appRegularFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func appMediumFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Medium", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    class func appHeavyFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Heavy", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    class func appBoldFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    class func appDemiBoldFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-DemiBold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
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
