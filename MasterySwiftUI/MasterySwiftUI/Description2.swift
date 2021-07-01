//
//  Description2.swift
//  MasterySwiftUI
//
//  Created by Imran on 18/5/21.
//

import SwiftUI

struct Description2: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Title")
                .font(.title3)
            Text("Subtitle")
                
                .font(.callout)
                .foregroundColor(.gray)
            Text("Short description of what I am demonstrating goes here.Short description of what I am demonstrating goes here.")
                .frame(maxWidth: .infinity)
                .font(.title)
                
                .foregroundColor(Color.white)
                .padding()
                .background(Color.blue)
//                .padding()
            
            Image("bottom3")
                .opacity(0.5)
                .background(Color.red.opacity(0.1))
                .background(Color.green.opacity(0.5))
                .background(Color.blue.opacity(0.8))
                .overlay(
                    VStack {
                        Text("models")
                        Text("12123")
                    }
                )
            
            Text("Shapes")
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.blue))
                
               
            
            
        }
        .font(.largeTitle)
//        .padding()
        
    }
    
}


struct Description2_Previews: PreviewProvider {
    static var previews: some View {
        Description2()
            .preferredColorScheme(.dark)
    }
}
