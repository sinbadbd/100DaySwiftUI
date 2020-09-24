//
//  GrapView.swift
//  7-CoinTracker
//
//  Created by Imran on 24/9/20.
//

import SwiftUI

struct GrapView: View {
    
    @State private var on = false
    
    var data: [Double]
    
    var stokeColor : Color = Color.blue
    
    var body: some View {
        VStack{
            LineGraph(dataPoints: data)
                .trim(to: on ? 1 : 0)
                .stroke(stokeColor,lineWidth: 2)
                .aspectRatio(16/9, contentMode: .fit)
                .border(Color.base, width: 1)
                .padding()
                .onAppear{
                    withAnimation(Animation.easeOut(duration: 2)){
                        self.on.toggle()
                    }
                }
        }
    }
}

//struct GrapView_Previews: PreviewProvider {
//    static var previews: some View {
//        GrapView()
//    }
//}
