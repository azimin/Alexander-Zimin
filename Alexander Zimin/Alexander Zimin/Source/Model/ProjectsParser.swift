//
//  ProjectParser.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 25/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import Foundation

class ProjectInfo {
    var name: String
    var description: String
    var isURL: Bool = false
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
        
        let candidateURL = NSURL(string: description)
        if candidateURL?.scheme != nil && candidateURL?.host != nil {
            isURL = true
        }
    }
}

class Project {
    private struct Keys {
        static var nameKey = "name"
        static var imageNameKey = "image_name"
        static var urlKey = "url"
        static var isMacOSKey = "is_mac_OS"
        static var infoKey = "info"
        
        static var infoNameKey = "name"
        static var infoDescriptionKey = "description"
    }
    
    var name: String
    var imageName: String
    var url: String
    var isMacOs: Bool
    var additionalInfo: [ProjectInfo] = []
    
    init(info: NSDictionary) {
        name = info.parse(Keys.nameKey)
        imageName = info.parse(Keys.imageNameKey)
        url = info.parse(Keys.urlKey)
        isMacOs = info.parse(Keys.isMacOSKey, anotherValue: false)
        
        for additionalInfoItem in info.objectForKey(Keys.infoKey) as! [NSDictionary] {
            let infoName = additionalInfoItem.objectForKey(Keys.infoNameKey) as! String
            let infoDescription = additionalInfoItem.objectForKey(Keys.infoDescriptionKey) as! String
            
            let projectInfo = ProjectInfo(name: additionalInfoItem.parse(Keys.infoNameKey), description: additionalInfoItem.parse(Keys.infoDescriptionKey))
            additionalInfo.append(projectInfo)
        }
        
        additionalInfo.insert(ProjectInfo(name: "URL", description: url), atIndex: 0)
    }
}

class ProjectsParser {
    static var projects: [Project] = ProjectsParser.loadProjects()
    
    private class func loadProjects() -> [Project] {
        var result: [Project] = []
        var arr = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("Projects", ofType: "plist")!)!
        
        for dict in arr as! [NSDictionary] {
            var entity = Project(info: dict)
            result.append(entity)
        }
        
        return result
    }
}