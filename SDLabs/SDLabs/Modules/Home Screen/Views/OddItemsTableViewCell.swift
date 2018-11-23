//
//  OddItemsTableViewCell.swift
//  SDLabs
//
//  Created by Pardeep on 23/11/18.
//  Copyright © 2018 Pardeep. All rights reserved.
//

import UIKit

///This class comprises of UI in case of odd items; consist of one image
class OddItemsTableViewCell: UITableViewCell {

    //MARK:- IBOutlets
    @IBOutlet weak var imageViewOne: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
