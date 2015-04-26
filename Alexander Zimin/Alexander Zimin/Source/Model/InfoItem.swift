//
//  InfoItem.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 26/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import Foundation
import UIKit

enum URLType {
    case None
    case URL
    case Email
}

class InfoItem {
    var name: String
    var description: String
    var isURL: Bool = false
    
    func doAction() {
        var urlString = description
        
        if type == .Email {
            urlString = "mailto:" + urlString + "?subject=WWDC2015"
        }
        
        let url = NSURL(string: urlString)
        if let url = url {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    var type: URLType {
        if !isURL {
            return .None
        }
        
        if isValidEmail(description) {
            return .Email
        }
        
        return .URL
    }
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
        
        let candidateURL = NSURL(string: description)
        if (candidateURL?.scheme != nil && candidateURL?.host != nil) || isValidEmail(description) {
            isURL = true
        }
    }
}

private func isValidEmail(testStr: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluateWithObject(testStr)
}