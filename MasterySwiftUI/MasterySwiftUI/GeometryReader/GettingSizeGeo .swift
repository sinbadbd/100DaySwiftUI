//
//  GettingSizeGeo .swift
//  MasterySwiftUI
//
//  Created by Imran on 3/7/21.
//

import SwiftUI

struct GettingSizeGeo_: View {
    var body: some View {
        VStack{
            Text("Getting size")
            GeometryReader {geo in
                VStack{
                    Text("Size")
                    Text("with:\(geo.size.width)")
                    Text("with:\(geo.size.height)")
                }.foregroundColor(.white)
            }
            .background(Color.blue)
            
            GeometryReader {geo in
                VStack{
                    Text("Size")
                    Text("with:\(geo.size.width)")
                    Text("with:\(geo.size.height)")
                }.foregroundColor(.white)
                
            }
            .background(Color.green)
            .padding(50)
            
            GeometryReader {geo in
                VStack{
                    Text("Size")
                    Text("with:\(geo.size.width)")
                    Text("with:\(geo.size.height)")
                }.foregroundColor(.white)
                
            }
            .background(Color.yellow)
            .padding(20)
        }
       
    }
}

struct GettingSizeGeo__Previews: PreviewProvider {
    static var previews: some View {
        GettingSizeGeo_()
    }
}
