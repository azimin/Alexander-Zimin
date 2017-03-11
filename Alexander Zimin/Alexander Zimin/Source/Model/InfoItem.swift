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
    case none
    case url
    case email
}

class InfoItem {
    var name: String
    var description: String
    var isURL: Bool = false
    
    func doAction() {
        var urlString = description
        
        if type == .email {
            urlString = "mailto:" + urlString + "?subject=WWDC2015"
        }
        
        let url = URL(string: urlString)
        if let url = url {
            UIApplication.shared.openURL(url)
        }
    }
    
    var type: URLType {
        if !isURL {
            return .none
        }
        
        if isValidEmail(description) {
            return .email
        }
        
        return .url
    }
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
        
        let candidateURL = URL(string: description)
        if (candidateURL?.scheme != nil && candidateURL?.host != nil) || isValidEmail(description) {
            isURL = true
        }
    }
}

private func isValidEmail(_ testStr: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}
