//
//  Color.swift
//  FWCheckin
//
//  Created by tai on 21/12/2563 BE.
//

import UIKit

extension UIColor {
    
    convenience init(hex: String, a: CGFloat = 1.0) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: a
        )
    }
    
    
    struct AppColor {
    
        static let lblPink = UIColor(hex: "F0C3C3")
        static let lblRed = UIColor(hex: "BA3C3C")
        static let lblBlack = UIColor(hex: "232323")
        
        static let btnGreen = UIColor(hex: "0C590A")
    
        
        static let background = UIColor(hex: "F6F6F6")
        static let fontFocus = UIColor(hex: "4A4A4A")
        static let fontDescription = UIColor(hex: "9B9B9B")
        static let bgTextField = UIColor(hex: "E5E5E5")
        

    }
}

