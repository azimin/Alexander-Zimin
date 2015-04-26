//
//  InterestsParser.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 26/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import Foundation

class Interest {
    private struct Keys {
        static var nameKey = "name"
        static var imageNameKey = "image_name"
        static var descriptionKey = "description"
    }
    
    var name: String
    var imageName: String
    var description: String
    
    init(info: NSDictionary) {
        name = info.parse(Keys.nameKey)
        imageName = info.parse(Keys.imageNameKey)
        description = info.parse(Keys.descriptionKey)
    }
}

class InterestsParser {
    static var interests: [Interest] = InterestsParser.loadInterests()
    
    private class func loadInterests() -> [Interest] {
        var result: [Interest] = []
        var arr = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("Interests", ofType: "plist")!)!
        
        for dict in arr as! [NSDictionary] {
            var entity = Interest(info: dict)
            result.append(entity)
        }
        
        return result
    }
}