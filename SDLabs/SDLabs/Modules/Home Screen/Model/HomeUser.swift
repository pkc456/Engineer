//
//  HomeUser.swift
//  SDLabs
//
//  Created by Pardeep on 22/11/18.
//  Copyright © 2018 Pardeep. All rights reserved.
//

import UIKit

///This class holds the home user model object
class HomeUser: NSObject {
    
    // MARK: - Properties
    var userArray: [HomeUserItem] = []
    
    /// This is the initializer method which initiates home user model
    init(data: [[String: Any]]) {
        
        for dataValue in data {
            let userItemData = HomeUserItem(data: dataValue)
            userArray.append(userItemData)
        }
    }
    
}
