//
//  LimitDragGesture.swift
//  MasterySwiftUI
//
//  Created by Imran on 1/7/21.
//

import SwiftUI

struct LimitDragGesture: View {
    
    @State private var currentSlidePositon:CGFloat = 0.0
    @GestureState private var slideOffset = CGSize.zero
    
    var body: some View {
        VStack {
            Text("Gestures")
                .font(.largeTitle)
            
            Text("Limit to X Axis").foregroundColor(.gray)
            Text("You might want to limit the drag of your view so the user can only drag horizontally or vertically.")
                .frame(width: .infinity).padding()
                .background(Color.blue).foregroundColor(.white)
            Text("slide Offset: \(Int(slideOffset.width)) , \(Int(slideOffset.height))")
            Text("Current Postion: \(currentSlidePositon)")
            
            
            GeometryReader( content: { geometry in
                HStack {
                    Spacer()
                    Image(systemName: "line.horizontal.3")
                        .font(.title)
                        .rotationEffect(.degrees(90))
                }
                .foregroundColor(.white)
                .frame(height:100)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.red))
                .offset(x: self.currentSlidePositon + self.slideOffset.width)
                .gesture(
                    DragGesture()
                        .updating(self.$slideOffset, body: { (value, slideOffset, tran) in
                            slideOffset = value.translation
                        })
                        .onEnded({ value in
                            if value.translation.width < geometry.size.width * 0.6 {
                                self.currentSlidePositon = 50 - geometry.size.width
                            }else {
                                self.currentSlidePositon = 0
                            }
                        }))
                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                
            })
            
            
        }
    }
}

struct LimitDragGesture_Previews: PreviewProvider {
    static var previews: some View {
        LimitDragGesture()
    }
}
