//
//  PositioninGeo.swift
//  MasterySwiftUI
//
//  Created by Imran on 3/7/21.
//

import SwiftUI

struct PositioninGeo: View {
    var body: some View {
        VStack{
//            Color.gray
            GeometryReader { geo in
                Text("Upper Text")
                    .font(.largeTitle)
                    .foregroundColor(.red)
//                    .background(UIColor.green)
                    .position(
                        x: geo.size.width / 4,
                        y: geo.size.height/10
                    )
                Text("Upper Text")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .position(x: geo.size.width - 90, y: geo.size.height - 40)
            }
            .background(Color.green)
            
            
        }
    }
}

struct PositioninGeo_Previews: PreviewProvider {
    static var previews: some View {
        PositioninGeo()
    }
}
