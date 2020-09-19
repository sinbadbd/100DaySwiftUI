//
//  TabButton.swift
//  RecipeAppUI
//
//  Created by Imran on 19/9/20.
//

import SwiftUI

struct TabButton: View {
    var title : String
    @Binding var selectedTab : String
    
    var body: some View{
        
        Button(action: {selectedTab = title}) {
            
            HStack(spacing: 10){
                
                Image(title)
                    .renderingMode(.template)
                
                Text(title)
                    .fontWeight(.semibold)
            }
            .foregroundColor(selectedTab == title ? Color("yellow") : .gray)
            .padding(.vertical,10)
            .padding(.horizontal,15)
            .background(Color("yellow").opacity(selectedTab == title ? 0.15 : 0))
            .clipShape(Capsule())
        }
    }
}

//struct TabButton_Previews: PreviewProvider {
//    static var previews: some View {
//        TabButton()
//    }
//}
