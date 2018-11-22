//
//  NSDictionary+Value.swift
//  SDLabs
//
//  Created by Pardeep on 22/11/18.
//  Copyright © 2018 Pardeep. All rights reserved.
//

import Foundation

///This is the extension of Dictionary
extension Dictionary {

    func stringValueAtPath(keyPath: String) -> String {

        let dictionary = self as NSDictionary
        return dictionary.value(forKeyPath: keyPath) as? String == nil ? "" : dictionary.value(forKeyPath: keyPath) as! String
    }

    func boolValueAtPath(keyPath: String) -> Bool {

        let dictionary = self as NSDictionary
        return dictionary.value(forKeyPath: keyPath) as? Bool == nil ? false : dictionary.value(forKeyPath: keyPath) as! Bool
    }

    func integerValueAtPath(keyPath: String) -> Int {

        let dictionary = self as NSDictionary
        return dictionary.value(forKeyPath: keyPath) as? Int == nil ? 0 : dictionary.value(forKeyPath: keyPath) as! Int
    }

    func doubleValueAtPath(keyPath: String) -> Double {

        let dictionary = self as NSDictionary
        return dictionary.value(forKeyPath: keyPath) as? Double == nil ? 0.0 : dictionary.value(forKeyPath: keyPath) as! Double
    }

    func arrayOfStringAtPath(keyPath: String) -> [String] {

        let dictionary = self as NSDictionary
        return dictionary.value(forKeyPath: keyPath) as? [String] == nil ? [] : dictionary.value(forKeyPath: keyPath) as! [String]
    }

    func integerValueAtPathForUsage(keyPath: String) -> Int {

        let dictionary = self as NSDictionary
        return dictionary.value(forKeyPath: keyPath) as? Int == nil ? -1001 : dictionary.value(forKeyPath: keyPath) as! Int
    }

}


