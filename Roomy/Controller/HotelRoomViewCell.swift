//
//  HotelRoomViewCell.swift
//  Roomy
//
//  Created by Mahmoud El-Melligy on 11/18/19.
//  Copyright © 2019 Mahmoud El-Melligy. All rights reserved.
//

import UIKit

class HotelRoomCell: UITableViewCell {
    @IBOutlet weak var roomTitle: UILabel!
    @IBOutlet weak var roomprice: UILabel!
    @IBOutlet weak var roomPlace: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
