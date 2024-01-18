//
//  UILabel + Extension.swift
//  Hotels
//
//  Created by mac on 06.09.2023.
//

import UIKit

extension UILabel {
    
    convenience init(text: String,
                     font: UIFont?,
                     textColor: UIColor?,
                     backgrounColor: UIColor? = .white
    ) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = textColor
        self.backgroundColor = backgrounColor
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
    }
    
}
