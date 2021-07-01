//
//  ContentView.swift
//  MasterySwiftUI
//
//  Created by Imran on 18/5/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
//            GestureExample()
//            HighPriorityGestureExample()
//            TransactionExample()
            StepperView()
        }
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
