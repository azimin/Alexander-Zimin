//
//  ProjectParser.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 25/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import Foundation

class Project {
    fileprivate struct Keys {
        static var nameKey = "name"
        static var imageNameKey = "image_name"
        static var urlKey = "url"
        static var isMacOSKey = "is_mac_OS"
        static var infoKey = "info"
        static var screenshotsKey = "screenshots"
        
        static var infoNameKey = "name"
        static var infoDescriptionKey = "description"
    }
    
    var name: String
    var imageName: String
    var url: String
    var isMacOs: Bool
    var additionalInfo: [InfoItem] = []
    var screenshotsNames: [String] = []
    
    init(info: NSDictionary) {
        name = info.parse(Keys.nameKey)
        imageName = info.parse(Keys.imageNameKey)
        url = info.parse(Keys.urlKey)
        isMacOs = info.parse(Keys.isMacOSKey, anotherValue: false)
        screenshotsNames = info.parse(Keys.screenshotsKey, anotherValue: [])
        
        for additionalInfoItem in info.object(forKey: Keys.infoKey) as! [NSDictionary] {
            let projectInfo = InfoItem(name: additionalInfoItem.parse(Keys.infoNameKey), description: additionalInfoItem.parse(Keys.infoDescriptionKey))
            additionalInfo.append(projectInfo)
        }
        
        additionalInfo.insert(InfoItem(name: "URL", description: url), at: 0)
    }
}

class ProjectsParser {
    static var projects: [Project] = ProjectsParser.loadProjects()
    
    fileprivate class func loadProjects() -> [Project] {
        var result: [Project] = []
        let arr = NSArray(contentsOfFile: Bundle.main.path(forResource: "Projects", ofType: "plist")!)!
        
        for dict in arr as! [NSDictionary] {
            let entity = Project(info: dict)
            result.append(entity)
        }
        
        return result
    }
}
