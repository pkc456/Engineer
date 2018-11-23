//
//  HomeTableHeaderView.swift
//  SDLabs
//
//  Created by Pardeep on 23/11/18.
//  Copyright © 2018 Pardeep. All rights reserved.
//

import UIKit

class HomeTableHeaderView: UIView {

    // MARK: - Variables and IBOutlets
    var view: UIView!
    @IBOutlet weak var imageViewUser: UIImageView!
    @IBOutlet weak var labelUserName: UILabel!
    
    // MARK: - View Setup
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    private func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let view = UINib(nibName: "HomeTableHeaderView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    /// Method called when data is ready to render the view
    /// - parameter homeUserItem: homeUserItem model instance
    func initiateWith(homeUserItem: HomeUserItem) {
//        imageViewUser.image = UIImage(named: homeUserItem.image ?? "")
        labelUserName.text = homeUserItem.name
    }

}
