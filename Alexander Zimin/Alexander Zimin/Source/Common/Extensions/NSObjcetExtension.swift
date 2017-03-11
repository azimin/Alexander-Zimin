//
//  NSObjcetExtension.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 25/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import Foundation

extension NSObject {
    func fill<T>(_ action: (T!) -> ()) -> T! {
        return self as! T
    }
}

extension NSDictionary {
    func parse<T>(_ key: String) -> T {
        return self.object(forKey: key) as! T
    }
    
    func parse<T>(_ key: String, anotherValue: T) -> T {
        return (self.object(forKey: key) as? T) ?? anotherValue
    }
}
