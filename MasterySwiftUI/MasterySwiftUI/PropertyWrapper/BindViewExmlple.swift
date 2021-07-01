//
//  BindViewExmlple.swift
//  MasterySwiftUI
//
//  Created by Imran on 22/5/21.
//

import SwiftUI

struct BindViewExmlple: View {
    
    @Binding  var incrementValue : Int
    
    var body: some View {
        VStack{
            Button(action: {
                self.incrementValue += 1
            }, label: {
                Text("Binding View Button")
            }) 
        }
    }
}

//struct BindViewExmlple_Previews: PreviewProvider {
//    static var previews: some View {
//        BindViewExmlple(incrementValue: 1)
//    }
//}
