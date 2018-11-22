//
//  HomeService.swift
//  SDLabs
//
//  Created by Pardeep on 22/11/18.
//  Copyright © 2018 Pardeep. All rights reserved.
//

import Foundation

/// Class for calling api related to home screen
class HomeService {
    
    /// Fetched home screen data from local json file
    func readFromLocal(onCompletion: @escaping (Bool, Home?) -> Void) {    
        
        let hotOffersDict = NSObject().readJson("HomeData")        
        let homeData: Home = Home(data: hotOffersDict as! [String : Any])
        
        onCompletion(true, homeData)
    }
    
}
