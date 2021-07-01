//
//  DragGesture_OnChanged.swift
//  MasterySwiftUI
//
//  Created by Imran on 30/6/21.
//

import SwiftUI

struct DragGesture_OnChanged: View {
    
    @State private var circlePosition = CGPoint(x: 100, y: 40)
    @State private var circleLable = "23,23"
    
    var body: some View {
        VStack{
            Text("Gestures").font(.largeTitle)
            Text("Drag - OnChanged").foregroundColor(.gray)
            Text("Attach a drag gesture modifier to a view to allow a user to drag it. Use the onChanged callback to get information about the drag.")                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
            Text("Drag the circle")
            Circle()
                .fill(Color.blue)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                .opacity(0.5)
                .overlay(
                    Text(circleLable)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    
                )
                .position(circlePosition)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            
                            self.circlePosition = value.location
                            self.circleLable = "\(Int(value.location.x)), \(Int(value.location.y))"
                        })
                )
            
            
            
        }
    }
}

struct DragGesture_OnChanged_Previews: PreviewProvider {
    static var previews: some View {
        DragGesture_OnChanged()
    }
}
