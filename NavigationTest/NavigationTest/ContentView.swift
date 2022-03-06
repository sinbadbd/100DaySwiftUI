//
//  ContentView.swift
//  NavigationTest
//
//  Created by Imran on 6/3/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingDetailsView = false
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: Text("Second View")){
                    Text("Hello, world!")
                        .padding()
                }
                
                NavigationLink(destination: ResultView(choice: "sdfsf")) {
                    Text("sdf")
                }
                
                NavigationLink(destination: Text("Second View"), isActive: $isShowingDetailsView) {
                    EmptyView()
                }
                Button("Tap to show detail") {
                    self.isShowingDetailsView = true
                }
            }
            
            .navigationTitle("Navigation")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct ResultView: View {
    var choice: String
    
    var body: some View {
        Text("You chose \(choice)")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
