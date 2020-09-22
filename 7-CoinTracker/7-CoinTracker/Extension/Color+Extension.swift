//
//  Color+Extension.swift
//  7-CoinTracker
//
//  Created by Imran on 23/9/20.
//

import SwiftUI

extension Color {
    static let base =  Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1))
    static let grayish = Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    static let greenish = Color(#colorLiteral(red: 0.003531678082, green: 0.7845943921, blue: 0.2554045377, alpha: 1))
    static let drakShadow = Color(#colorLiteral(red: 0.003531678082, green: 0, blue: 0.2554045377, alpha: 1))
    
    init(hex: String) {
        self.init(UIColor(hex: hex))
    }
}

extension UIColor {
    convenience init(hex: String){
        var inputString = hex.trimmingCharacters(in: .whitespaces).uppercased()
        if inputString.hasPrefix("#") {
            inputString.remove(at: inputString.startIndex)
            
        }
        
        var rgbValue : UInt64 = 0
        Scanner(string: inputString).scanHexInt64(&rgbValue)
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat( rgbValue & 0x0000FF ) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
