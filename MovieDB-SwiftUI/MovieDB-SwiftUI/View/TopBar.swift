//
//  TopBar.swift
//  MovieDB-SwiftUI
//
//  Created by Imran on 27/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import SwiftUI

struct TopBar: View {
    var body: some View {
        HStack{
            Text("Movies")
                .font(.title)
                .fontWeight(.semibold)
            Spacer(minLength: 0)
            
            Button(action: {}){
                Image(systemName: "magnifyingglass")
                    .renderingMode(.original)
                    .foregroundColor(.black)
                    .frame(width: 40, height: 40)
            }
            
            
        }
        .padding([.horizontal,.bottom])
        .padding(.top,5)
    }
}

struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBar()
    }
}
