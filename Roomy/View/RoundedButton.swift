//
//  RoundedButton.swift
//  Roomy
//
//  Created by Mahmoud El-Melligy on 11/18/19.
//  Copyright © 2019 Mahmoud El-Melligy. All rights reserved.
//

import Foundation
import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        //making button corner button
        layer.cornerRadius = 25
        clipsToBounds = true
    }

}
