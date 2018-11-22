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
    var message: String?
    var userData: [HomeUser] = []

    /// This is the initializer method which initiates Main home model
    init(data: [String: Any]) {
        message = data.stringValueAtPath(keyPath: "message")

        if let agreement = data["data"] as? [[String: Any]] {
            for data in agreement {
                let agreementData = HomeUser(data: data)
                userData.append(agreementData)
            }
        }
        
        
    }
}
