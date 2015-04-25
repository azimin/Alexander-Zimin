//
//  NSObjcetExtension.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 25/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import Foundation

extension NSObject {
    func fill<T>(action: (T!) -> ()) -> T! {
        return self as! T
    }
}

extension NSDictionary {
    func parse<T>(key: String) -> T {
        return self.objectForKey(key) as! T
    }
    
    func parse<T>(key: String, anotherValue: T) -> T {
        return (self.objectForKey(key) as? T) ?? anotherValue
    }
}