//
//  EducationParser.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 26/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import Foundation

class EducationParser {
    private struct Keys {
        static var infoNameKey = "name"
        static var infoDescriptionKey = "description"
    }
    
    static var education: [[InfoItem]] = EducationParser.loadEducationInfo()
    
    private class func loadEducationInfo() -> [[InfoItem]] {
        var result: [[InfoItem]] = []
        var arr = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("Education", ofType: "plist")!)!
        
        for educationCategoryArray in arr as! [NSArray] {
            var localResult: [InfoItem] = []
            
            for additionalInfoItem in educationCategoryArray as! [NSDictionary] {
                let infoName = additionalInfoItem.objectForKey(Keys.infoNameKey) as! String
                let infoDescription = additionalInfoItem.objectForKey(Keys.infoDescriptionKey) as! String
                
                let projectInfo = InfoItem(name: additionalInfoItem.parse(Keys.infoNameKey), description: additionalInfoItem.parse(Keys.infoDescriptionKey))
                localResult.append(projectInfo)
            }
            
            result.append(localResult)
        }
        
        return result
    }
}