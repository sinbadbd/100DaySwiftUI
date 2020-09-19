//
//  CategoryCard.swift
//  RecipeAppUI
//
//  Created by Imran on 19/9/20.
//

import SwiftUI

struct CategoryCard: View {
    var title : String
    
    var body: some View {
        VStack(spacing:20){
            Image(title)
                .padding()
                .background(Color.white)
                .clipShape(Circle())
            Text(title)
                .fontWeight(.bold)
//                .foregroundColor(Color("orange"))
        }
        .padding(.vertical)
        .padding(.horizontal,10)
        .background(Color("orange"))
        .cornerRadius(20)
    }
}

//struct CategoryCard_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryCard()
//    }
//}
