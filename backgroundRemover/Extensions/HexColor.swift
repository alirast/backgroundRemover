//
//  HexColor.swift
//  backgroundRemover
//
//  Created by N S on 25.10.2023.
//

import UIKit

extension UIColor {
    static let blueColor = UIColor(hex: "2C53EC")
    static let grayColor1 = UIColor(hex: "7B7B7B")
    
    convenience init(hex: String, alpha: CGFloat? = nil) {
        var hex: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hex.hasPrefix("#") {
            hex.remove(at: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgbValue)
        
        var aValue: UInt64
        let rValue, gValue, bValue: UInt64
        switch hex.count {
        case 3:
            (aValue, rValue, gValue, bValue) = (255, (rgbValue >> 4 & 0xF) * 17, (rgbValue >> 4 & 0xF) * 17, (rgbValue & 0xF) * 17)
        case 6: // RGB (24-bit)
            (aValue, rValue, gValue, bValue) = (255, rgbValue >> 16, rgbValue >> 8 & 0xFF, rgbValue & 0xFF)
        case 8: // ARGB (32-bit)
            (aValue, rValue, gValue, bValue) = (rgbValue >> 24, rgbValue >> 16 & 0xFF,
                                                rgbValue >> 8 & 0xFF, rgbValue & 0xFF)
        default: // gray as like systemGray
            (aValue, rValue, gValue, bValue) = (255, 123, 123, 129)
        }
        
        if let alpha = alpha, alpha >= 0, alpha <= 1 {
            aValue = UInt64(alpha * 255)
        }
        
        self.init(
            red: CGFloat(rValue) / 255,
            green: CGFloat(gValue) / 255,
            blue: CGFloat(bValue) / 255,
            alpha: CGFloat(aValue) / 255)
    }
    
    func hexStringFromColor() -> String {
        let components = self.cgColor.components
        let r: CGFloat = components?[0] ?? 0.0
        let g: CGFloat = components?[1] ?? 0.0
        let b: CGFloat = components?[2] ?? 0.0

        let hexString = String.init(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
        return hexString
     }
}
