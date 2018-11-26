//
//  Constants.swift
//  SDLabs
//
//  Created by Pardeep on 26/11/18.
//  Copyright © 2018 Pardeep. All rights reserved.
//

import UIKit

///This class represents the constants such as api urls, loader text

class Constants: NSObject {
    
    struct APIUrl {
        static let kBaseUrl = "http://sd2-hiring.herokuapp.com/api/"
        static let kHomeApi = "users?offset=10&limit=10"
    }
    
    struct LoaderText {
        static let kError = "Some error occured"
        static let kLoading = "Please wait"
    }
    
}
