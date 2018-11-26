//
//  EvenItemsTableViewCell.swift
//  SDLabs
//
//  Created by Pardeep on 23/11/18.
//  Copyright © 2018 Pardeep. All rights reserved.
//

import UIKit

///This class comprises of UI in case of even items; consist of two images
class EvenItemsTableViewCell: UITableViewCell {

    //MARK:- IBOutlets

    @IBOutlet weak var imageViewOne: UIImageView!
    @IBOutlet weak var imageViewTwo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /// Method called when data is ready to render the view
    /// - parameter initiateWith: image url string for first image
    /// - parameter initiateWith: image url string for second image
    func initiateWith(imageUrlOne: String, imageUrlTwo: String){
    }
    
}
