//
//  UnderlineTextField.swift
//  Roomy
//
//  Created by Mahmoud El-Melligy on 11/18/19.
//  Copyright © 2019 Mahmoud El-Melligy. All rights reserved.
//

import UIKit

class UnderlineTextField :  UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        //making button corner button
        let border = CALayer()
        let width = CGFloat(1)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width-10, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
}

