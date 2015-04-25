//
//  InfoItem.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 26/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import Foundation

class InfoItem {
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
