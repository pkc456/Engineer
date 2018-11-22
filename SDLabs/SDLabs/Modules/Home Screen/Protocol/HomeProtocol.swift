//
//  HomeProtocol.swift
//  SDLabs
//
//  Created by Pardeep on 22/11/18.
//  Copyright © 2018 Pardeep. All rights reserved.
//

import Foundation

/// Protocol to be implemented by Home view class
protocol IHomeView: NSObjectProtocol {
    
    /// Shows full screen loader
    func showLoader()
    
    /// Hides the loader
    func hideLoader()
    
    ///This method will show the popup message
    /// - parameter message: message string of popup    
    func showPopup(message: String)
}


/// Protocol to be implemented by Home presenter class
protocol IHomePresenter {
    
    /// Method to attach agreement View with presenter
    func attachView(_ view: IHomeView)
    
    /// Method to detach agreement View from Presenter
    func detachView()
    
    /// Initiate flow for Service agreement screen    
    func initiateFlow()
    
}
