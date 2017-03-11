//
//  EducationParser.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 26/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import Foundation

class EducationParser {
    fileprivate struct Keys {
        static var infoNameKey = "name"
        static var infoDescriptionKey = "description"
    }
    
    static var education: [[InfoItem]] = EducationParser.loadEducationInfo()
    
    fileprivate class func loadEducationInfo() -> [[InfoItem]] {
        var result: [[InfoItem]] = []
        let arr = NSArray(contentsOfFile: Bundle.main.path(forResource: "Education", ofType: "plist")!)!
        
        for educationCategoryArray in arr as! [NSArray] {
            var localResult: [InfoItem] = []
            
            for additionalInfoItem in educationCategoryArray as! [NSDictionary] {
                let projectInfo = InfoItem(name: additionalInfoItem.parse(Keys.infoNameKey), description: additionalInfoItem.parse(Keys.infoDescriptionKey))
                localResult.append(projectInfo)
            }
            
            result.append(localResult)
        }
        
        return result
    }
}
