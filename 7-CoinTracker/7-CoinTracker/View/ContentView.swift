//
//  ContentView.swift
//  7-CoinTracker
//
//  Created by Imran on 22/9/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            GrapView(data: [0.4,0.3,0.9,0.21,0.6,0.0,0.1])
            Text("Hello, world!")
                .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
