//
//  StartPageView.swift
//  MasterySwiftUI
//
//  Created by Imran on 23/5/21.
//

import SwiftUI

struct StartPageView: View {
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color.green, lineWidth: 4)
                .frame(width: 150, height: 150)
            
            Circle()
                .stroke(Color.blue, lineWidth: 4)
                .frame(width: 150, height: 150)
                .offset(x: 70, y: -80)
            
            Circle()
                .stroke(Color.blue, lineWidth: 4)
                .frame(width: 150, height: 150)
                .offset(x: 120, y: -140)
            
            Circle()
                .stroke(Color.purple, lineWidth: 4)
                .frame(width: 150, height: 250)
                .offset(x: -9, y: -210)
        }
    }
}

struct StartPageView_Previews: PreviewProvider {
    static var previews: some View {
        StartPageView()
    }
}
