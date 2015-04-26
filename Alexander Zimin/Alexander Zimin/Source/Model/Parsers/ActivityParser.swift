//
//  ActivityParser.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 26/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import Foundation

class ActivityParser {
    private struct Keys {
        static var infoNameKey = "name"
        static var infoDescriptionKey = "description"
    }
    
    static var education: [[InfoItem]] = ActivityParser.loadActivities()
    
    private class func loadActivities() -> [[InfoItem]] {
        var result: [[InfoItem]] = []
        var arr = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("Activity", ofType: "plist")!)!
        
        for educationCategoryArray in arr as! [NSArray] {
            var localResult: [InfoItem] = []
            
            for additionalInfoItem in educationCategoryArray as! [NSDictionary] {
                let activityInfo = InfoItem(name: additionalInfoItem.parse(Keys.infoNameKey), description: additionalInfoItem.parse(Keys.infoDescriptionKey))
                localResult.append(activityInfo)
            }
            
            result.append(localResult)
        }
        
        return result
    }
}