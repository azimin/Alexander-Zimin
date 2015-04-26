//
//  ProjectParser.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 25/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import Foundation

class TechnicalSkill {
    private struct Keys {
        static var nameKey = "name"
        static var acquiredKey = "acquired"
        static var skillsKey = "skills"
    }
    
    var name: String
    var acquired: String
    var skills: [String] = []
    
    init(info: NSDictionary) {
        name = info.parse(Keys.nameKey)
        acquired = info.parse(Keys.acquiredKey)
        skills = info.parse(Keys.skillsKey)
    }
}

class TechnicalSkillParser {
    static var technicalSkills: [TechnicalSkill] = TechnicalSkillParser.loadTechnicalSkills()
    
    private class func loadTechnicalSkills() -> [TechnicalSkill] {
        var result: [TechnicalSkill] = []
        var arr = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("TechnicalSkills", ofType: "plist")!)!
        
        for dict in arr as! [NSDictionary] {
            var entity = TechnicalSkill(info: dict)
            result.append(entity)
        }
        
        return result
    }
}