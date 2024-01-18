//
//  UIColor + Extension.swift
//  Hotels
//
//  Created by mac on 06.09.2023.
//

import UIKit

extension UIColor {
    
    static func ratingLabelColor() -> UIColor {
        return #colorLiteral(red: 1, green: 0.6588235294, blue: 0, alpha: 1)
    }
    
    static func tagLabelBackgroundColor() -> UIColor {
        return #colorLiteral(red: 0.987567842, green: 0.9876653552, blue: 0.9906874299, alpha: 1)
    }
    static func tagLabelColor() -> UIColor {
        return #colorLiteral(red: 0.5098039216, green: 0.5294117647, blue: 0.5882352941, alpha: 1)
    }
    
    static func ratingLabelBackgroundColor() -> UIColor {
        return #colorLiteral(red: 1, green: 0.8130037189, blue: 0, alpha: 0.2)
    }
    
    static func blackColor() -> UIColor {
        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    static func locationButtonTitleColor() -> UIColor {
        return #colorLiteral(red: 0.05098039216, green: 0.4470588235, blue: 1, alpha: 1)
    }
    
    static func costDetailColor() -> UIColor {
        return #colorLiteral(red: 0.5811160207, green: 0.6012901664, blue: 0.6538151503, alpha: 1)
    }
    static func litleTextColor() -> UIColor {
        return #colorLiteral(red: 0.662745098, green: 0.6705882353, blue: 0.7176470588, alpha: 1)
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

