//
//  Home.swift
//  ECommerceComplexUI
//
//  Created by Imran on 28/1/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack{
            HStack{
                Button(action: {}, label: {
                    Image(systemName: "line.horizontal.3.decrease")
                        .font(.system(size: 25, weight: .heavy))
                        .foregroundColor(.black)
                })
                Spacer(minLength: 0)
                Button(action: {}) {
                    Image("profile")
                        .resizable()
                        .foregroundColor(.red)
                        .frame(width: 45, height: 45)
                        .cornerRadius(15)
                }
                .background(Color.red) //need remove
            }
            .padding(.vertical,20)
            .padding(.horizontal)
        }
        .background(Color.white.ignoresSafeArea())
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
