//
//  Home.swift
//  SDLabs
//
//  Created by Pardeep on 22/11/18.
//  Copyright © 2018 Pardeep. All rights reserved.
//

import UIKit

///This class holds the Main home model object
class Home: NSObject {

    // MARK: - Properties
    var status: Bool?
    var hasMore: Bool?
    var message: String?
    var userData: HomeUser = HomeUser(data: [[:]])

    /// This is the initializer method which initiates Main home model
    init(data: [String: Any]) {
        status = data.boolValueAtPath(keyPath: "status")
        message = data.stringValueAtPath(keyPath: "message")

        if let dataOfUser = data["data"] as? [String: Any] {
            if let userArray = dataOfUser["users"] as? [[String: Any]] {
                userData = HomeUser(data: userArray)
            }
            
            if let isMoreDataAvailable = dataOfUser["has_more"] as? Bool {
                    hasMore = isMoreDataAvailable
            }
            
        }
    }
    
}
