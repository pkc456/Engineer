//
//  HomePresenter.swift
//  SDLabs
//
//  Created by Pardeep on 22/11/18.
//  Copyright © 2018 Pardeep. All rights reserved.
//

import Foundation

///Presenter fo Home screen
class HomePresenter: IHomePresenter {
    
    weak fileprivate var homeView: IHomeView?

    
    func attachView(_ view: IHomeView) {
        homeView = view
    }
    
    func detachView() {
        homeView = nil
    }
    
    func initiateFlow() {
        getHomeData()
    }
    
    func getHomeData(){
        self.homeView?.showLoader()
        
        HomeService().getHomeData { (isSuccess, model) in
            self.homeView?.hideLoader()
            
            if !isSuccess || model == nil{                
                self.homeView?.showPopup(message: Constants.LoaderText.kError)
            }else{
                self.homeView?.loadHomeDataInUI(homeModel: model!)
            }
        }
        
    }
    
}
