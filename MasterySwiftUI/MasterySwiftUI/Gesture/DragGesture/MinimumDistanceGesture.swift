//
//  MinimumDistanceGesture.swift
//  MasterySwiftUI
//
//  Created by Imran on 1/7/21.
//

import SwiftUI

struct MinimumDistanceGesture: View {
    
    @GestureState private var circleOffset = CGSize.zero
    
    var body: some View {
        
        VStack{
            Text("Gestures").font(.largeTitle)
            Text("Drag - Minimum Distance")
                .foregroundColor(.gray)
            Text("You can set a minimum distance the user has to drag a view before it actually starts moving.")
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
                .foregroundColor(.white)
            Text("Drag the image out of the circle")
            .padding(.bottom)
            
            ZStack{
                Circle()
                    .stroke(Color.blue, lineWidth: 5)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                Image(systemName: "doc.on.doc.fill")
                    .foregroundColor(.blue)
                    .offset(circleOffset)
                    .gesture(DragGesture(minimumDistance: 50)
                                .updating($circleOffset, body: { (value, circleOffset, transition) in
                                    circleOffset = value.translation
                                })
                    )
            }
        }
        
        
    }
}

struct MinimumDistanceGesture_Previews: PreviewProvider {
    static var previews: some View {
        MinimumDistanceGesture()
    }
}
