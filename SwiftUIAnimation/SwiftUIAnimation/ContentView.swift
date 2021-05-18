//
//  ContentView.swift
//  SwiftUIAnimation
//
//  Created by Imran on 17/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isHalf = false
    @State private var isDim = false
    
    var body: some View {
        VStack{
            Spacer()
            Image("apple")
                .resizable()
                
                .scaleEffect(isDim ? 0.5 : 3)
                .opacity(isHalf ? 0.5 : 1.0)
                .animation(.easeOut(duration: 1.0))
                .frame(width: 50, height: 50, alignment: .top)
                .onTapGesture {
                    self.isDim.toggle()
                    self.isHalf.toggle()
                }
            Spacer()
            if isHalf {
                TestView()
            }
           
            Spacer()
        }
        
        
        
    }
}
struct TestView: View {
    var body: some View {
        VStack{
            Text("Test")
                .font(.title3)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 mini")
    }
}
