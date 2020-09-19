//
//  CustomTabBar.swift
//  RecipeAppUI
//
//  Created by Imran on 19/9/20.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab : String
    var body: some View {
        HStack{
            
          //  Spacer(minLength: 0)
            TabButton(title: "Home", selectedTab: $selectedTab)
            Spacer(minLength: 0)
            Button(action: {}) { 
                Image("plus")
                    .renderingMode(.original)
                    .padding(.vertical)
                    .padding(.horizontal,25)
                    .background(Color("orange"))
                    .cornerRadius(15)
            }
            Spacer(minLength: 0)
            TabButton(title: "Save", selectedTab: $selectedTab)
        }
        .padding(.top)
                .padding(.horizontal,22)
                .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .background(Color.white)
                .clipShape(CustomCorner(corners: [.topLeft,.topRight], size: 55))
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: -5)
    }
}

//struct CustomTabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTabBar()
//    }
//}
