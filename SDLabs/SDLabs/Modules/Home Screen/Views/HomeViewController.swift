//
//  HomeViewController.swift
//  SDLabs
//
//  Created by Pardeep on 22/11/18.
//  Copyright © 2018 Pardeep. All rights reserved.
//

import UIKit

///This class provide main entry point for Home screen
class HomeViewController: BaseViewController {
    
    //MARK:- IBOutlets and Variables
    
    @IBOutlet weak var homeView: HomeView!
    var homePresenter:HomePresenter = HomePresenter()

    //MARK:- View life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homePresenter.attachView(self)
    }
    
}

extension HomeViewController : IHomeView{
    
    func showLoader() {
        NMFLoadingOverlay.shared.showOverlay(view: self.view.window, with: "Please wait")
    }
    
    func hideLoader() {
        NMFLoadingOverlay.shared.hideOverlayView()
    }
    
    func showPopup(message: String) {
        if self.view.window != nil {
            let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}
