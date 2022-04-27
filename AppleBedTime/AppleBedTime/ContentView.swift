//
//  ContentView.swift
//  AppleBedTime
//
//  Created by Imran Mia on 9/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var arrRoted = RotationOfArray()
    @State var data = [1,2,3,4,5,6,7,8]
    var body: some View {
//        Home()
        VStack{
//            Text("\(arrRoted.getdata())")
           Text("arrRoted.getdata()")
                .onTapGesture {
                  let data =   arrRoted.getStarAndEndIndex(arrData: &data)
                print(data)
//                    print(arrRoted.startIndex)
//                    print(arrRoted.endIndex)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
