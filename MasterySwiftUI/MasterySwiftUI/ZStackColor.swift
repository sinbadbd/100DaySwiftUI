//
//  ZStackColor.swift
//  MasterySwiftUI
//
//  Created by Imran on 22/5/21.
//

import SwiftUI

struct ZStackColor: View {
    let colors: [Color] =
              [.red, .orange, .yellow, .green, .blue, .purple]
    var body: some View {
       ZStack {
           ForEach(0..<colors.count) {
               Rectangle()
                   .fill(colors[$0])
                   .frame(width: 100, height: 100)
                   .offset(x: CGFloat($0) * 10.0,
                            y: CGFloat($0) * 10.0)
            }
        }
    }

}

struct ZStackColor_Previews: PreviewProvider {
    static var previews: some View {
        ZStackColor()
    }
}
///     let colors: [Color] =
///         [.red, .orange, .yellow, .green, .blue, .purple]
///
      
