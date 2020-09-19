//
//  CustomCorner.swift
//  RecipeAppUI
//
//  Created by Imran on 19/9/20.
//

import SwiftUI

struct CustomCorner: Shape {
    var corners : UIRectCorner
       var size : CGFloat
       func path(in rect: CGRect) -> Path {
           
           let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: size, height: size))
           
           return Path(path.cgPath)
       }
}

//struct CustomCorner_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomCorner()
//    }
//}
