//
//  ContentView.swift
//  CombieSwiftUI
//
//  Created by Imran on 22/5/22.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    init(){
      
        exampleSubscribe()
        /* ----------------------Just---------------------------------------------------- */
        exampleJust()
        
        print("\n---------> Chapter 3: Transforming Operators <---------")
        collectingValues()
        mappingValue()
        tryMapValue()
        flatMapValues()
    }
    
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}




