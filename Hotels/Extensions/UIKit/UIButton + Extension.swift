//
//  UIButton + Extension.swift
//  Hotels
//
//  Created by mac on 06.09.2023.
//

import UIKit

extension UIButton {
    
    convenience init(title: String,
                     titleColor: UIColor,
                     backgroundColor: UIColor? = nil,
                     font: UIFont?,
                     cornerRadius: CGFloat = 15,
                     alignment: UIControl.ContentHorizontalAlignment) {
        self.init(type: .system)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRadius
        self.contentHorizontalAlignment = alignment
    }
    
}
