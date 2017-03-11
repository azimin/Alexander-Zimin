//
//  ProjectParser.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 25/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import Foundation

class TechnicalSkill {
    fileprivate struct Keys {
        static var nameKey = "name"
        static var descriptionKey = "description"
        static var skillsKey = "skills"
    }
    
    var name: String
    var description: String
    var skills: [String] = []
    
    init(info: NSDictionary) {
        name = info.parse(Keys.nameKey)
        description = info.parse(Keys.descriptionKey)
        skills = info.parse(Keys.skillsKey)
    }
}

class TechnicalSkillParser {
    static var technicalSkills: [TechnicalSkill] = TechnicalSkillParser.loadTechnicalSkills()
    
    fileprivate class func loadTechnicalSkills() -> [TechnicalSkill] {
        var result: [TechnicalSkill] = []
        let arr = NSArray(contentsOfFile: Bundle.main.path(forResource: "TechnicalSkills", ofType: "plist")!)!
        
        for dict in arr as! [NSDictionary] {
            let entity = TechnicalSkill(info: dict)
            result.append(entity)
        }
        
        return result
    }
}
