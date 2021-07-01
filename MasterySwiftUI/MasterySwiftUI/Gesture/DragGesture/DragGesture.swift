//
//  DragGesture.swift
//  MasterySwiftUI
//
//  Created by Imran on 30/6/21.
//

import SwiftUI

struct DragGestureChange: View {
    @State private var circlePosition = CGPoint(x: 100, y: 40)
    @State private var circleText = "100,40"
    @GestureState private var isDraging = false
    @State private var isOK = true
    
    var body: some View {
        VStack {
            Text("Circle Drag Gesture")
                .frame(width: .infinity)
            Text("Draging: \(isDraging.description)")
            Circle()
                .fill(isOK ? Color.red : Color.blue)
                .frame(width:100 , height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .overlay(
                    Text(circleText)
                )
                .position(circlePosition)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            self.circlePosition = value.location
                            self.circleText = "\(Int(value.location.x)),\(Int(value.location.y))"
                        })
                        // .updating($isDraging) { (value, state, transcation) in
                        //     state =  true
                        //  })
                        .onEnded({ value in
                            self.isOK = value.location.x < 200 ? true : false
                        }))
                .background(isOK ? Color.clear : Color.green)
            
        }
    }
}

struct DragGestureChange_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureChange()
    }
}
