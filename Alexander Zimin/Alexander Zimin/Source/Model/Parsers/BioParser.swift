//
//  BioParser.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 26/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import Foundation

class BioParser {
    private struct Keys {
        static var infoNameKey = "name"
        static var infoDescriptionKey = "description"
    }
    
    static var bioItems: [InfoItem] = BioParser.loadBioItems()
    
    private class func loadBioItems() -> [InfoItem] {
        var result: [InfoItem] = []
        
        var arr = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("Bio", ofType: "plist")!)!
        
        for additionalInfoItem in arr as! [NSDictionary] {
            let bioInfo = InfoItem(name: additionalInfoItem.parse(Keys.infoNameKey), description: additionalInfoItem.parse(Keys.infoDescriptionKey))
            result.append(bioInfo)
        }
        
        return result
    }
}