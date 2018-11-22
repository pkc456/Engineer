//
//  HomeView.swift
//  SDLabs
//
//  Created by Pardeep on 22/11/18.
//  Copyright © 2018 Pardeep. All rights reserved.
//

import UIKit

///This class holds the Home view
class HomeView: UIView {

    // MARK: - Variables and IBOutlets
    var view: UIView!
    
    // MARK: - View Setup
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let view = UINib(nibName: "HomeView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
}
