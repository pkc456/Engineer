//
//  WebServiceHandler.swift
//  SDLabs
//
//  Created by Pardeep on 23/11/18.
//  Copyright © 2018 Pardeep. All rights reserved.
//


import UIKit
import Alamofire

///This class interacts with Alamofire for api calling
class WebServiceHandler: NSObject {

    static let sharedInstance = WebServiceHandler()
    
    // MARK:- Common Request
    func getApiRequest(url: String, onCompletion: @escaping (Bool, Any?) -> Void) {
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                debugPrint(response)
                
                if let data = response.result.value{
                    onCompletion(true, data)
                }else{
                    onCompletion(false, nil)
                }
        }
        
    }

    
    // MARK:- Get API call
    
    ///This method calls the user api
    func callGetUserApiRequest(onCompletion: @escaping (Bool, Home?) -> Void) {
        
        let urlString = "http://sd2-hiring.herokuapp.com/api/users?offset=10&limit=10"
        
        self.getApiRequest(url: urlString) { (isSuccess, model) in
            
            if isSuccess{
                let homeData: Home = Home(data: model as! [String : Any])
                onCompletion(true, homeData)
            }else{
                onCompletion(false, nil)
            }
            
        }
        
    }
    
}
