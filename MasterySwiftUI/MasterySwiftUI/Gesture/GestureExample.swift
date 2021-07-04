//
//          GestureExample.swift
//          MasterySwiftUI
//
//          Created by Imran on 22    5    21.


import SwiftUI

struct GestureExample: View {
    @State private var message = "Message"
    let newGesture = TapGesture().onEnded {
        print("Tap on VStack.")
    }
    
    var body: some View {
        VStack(spacing:25) {
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 75, height: 75)
                .padding()
                .foregroundColor(.red)
                .onTapGesture {
                    print("Tap on image.")
                }
            Rectangle()
                .fill(Color.blue)
        }
        .gesture(newGesture)
        .frame(width: 200, height: 200)
        .border(Color.purple)
    }
}

struct GestureExample_Previews: PreviewProvider {
    static var previews: some View {
        GestureExample()
    }
}
