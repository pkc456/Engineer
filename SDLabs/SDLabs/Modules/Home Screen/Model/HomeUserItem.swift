//
//  HomeUserItem.swift
//  SDLabs
//
//  Created by Pardeep on 22/11/18.
//  Copyright © 2018 Pardeep. All rights reserved.
//

import UIKit

///This class holds the home user item model object
class HomeUserItem: NSObject {
    
    // MARK: - Properties
    var name: String?
    var image: String?
    var items: [String]?
    
    /// This is the initializer method which initiates home user model
    init(data: [String: Any]) {
        name = data.stringValueAtPath(keyPath: "name")
        image = data.stringValueAtPath(keyPath: "image")
        items = data.arrayOfStringAtPath(keyPath: "items")
    }
    
}
