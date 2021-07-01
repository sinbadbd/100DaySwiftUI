//
//  DragGestureCircle.swift
//  MasterySwiftUI
//
//  Created by Imran on 30/6/21.
//

import SwiftUI

struct DragGestureCircle: View {
    
    @State private var circlePosition = CGPoint(x: 100, y: 40)
    @State private var circleLable = "100,40"
    
    var body: some View {
        VStack {
            Text("OnDrag Circle Position Change")
            
            Circle()
                .fill(Color.blue)
                .frame(width: 100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100)
                .foregroundColor(.blue)
                .overlay(
                    Text(circleLable)
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

struct DragGestureCircle_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureCircle()
    }
}
