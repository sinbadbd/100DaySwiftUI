//
//  StateExmpleswift.swift
//  MasterySwiftUI
//
//  Created by Imran on 22/5/21.
//

import SwiftUI

struct StateExmpleswift: View {
    @State private var count = 0
    
    lazy var arr = [Int]()
    
    var body: some View {
        VStack{
            Text("\(count)")
                .padding()
                .font(.title)
                .foregroundColor(.blue)
                .border(Color.red)
                .animation(.easeInOut(duration: 0.5))
//                .rotationEffect(.init(degrees: 280))
                
            Button(action: {
                self.count += 1
               
            }, label: {
                Text("Increment")
                    .padding()
                    .foregroundColor(.red)
                    .cornerRadius(4)
                    .border(Color.green)
            })
            
            Button(action: {
                self.count -= 1
             }, label: {
                Text("Decrement")
                    .padding()
                    .foregroundColor(.red)
                    .cornerRadius(4)
                    .border(Color.green)
            })
            
            BindViewExmlple(incrementValue: $count)
//                .padding()
                .foregroundColor(.red)
                .cornerRadius(4)
                .border(Color.green)
        }
    }
}

struct StateExmpleswift_Previews: PreviewProvider {
    static var previews: some View {
        StateExmpleswift()
    }
}
