//
//  ReipesCard.swift
//  RecipeAppUI
//
//  Created by Imran on 19/9/20.
//

import SwiftUI

struct RecipesCard: View {
    var recipes : Recipe
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            HStack{
                Spacer(minLength: 0)
                Image(recipes.image)
            }
            Text(recipes.title)
                .font(.title2)
                .foregroundColor(.black)
            
            HStack(spacing: 12){
                Label(
                    title: {
                        Text(recipes.rating)
                            .foregroundColor(.gray)
                    },
                    icon: {
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundColor(Color("orange"))
                    }
                )
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(recipes.color.opacity(0.5))
                .cornerRadius(5)
                Text(recipes.type)
                    .foregroundColor(.gray)
            }
            Text(recipes.detail)
                .foregroundColor(Color.gray)
                .padding(.bottom)
                     
            
            HStack(spacing:0){
                ForEach(1...4, id:\.self){ i in
                    Image("p\(i)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 25, height: 25)
                        .offset(x: -CGFloat(i) * 8)
                }
                Text("25+ Likes")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.leading, -(4) * 6)
            }
            .padding(.bottom)
            
            HStack{
                Spacer(minLength: 0)
                Button( action: {}){
                    Label(
                        title: {
                            Text("Save")
                            
                        },
                        icon: {
                            Image(systemName: "suit.heart.fill")
                                .font(.body)
                                .foregroundColor(.orange)
                            
                        }
                    )
                }
            }
            .frame(width: 70, alignment: .trailing)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .background(Color.white)
            .clipShape(Capsule())
  
            .padding(.bottom)
        }
        .frame(width: UIScreen.main.bounds.width / 2)
        .padding(.horizontal)
        .background(
            recipes.color.opacity(0.4)
                .cornerRadius(25)
                .padding(.top,55)
        )
//        .cornerRadius(25)
    }
}

//struct ReipesCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ReipesCard(recipes: Recipe(image: "", title: "", detail: "", rating: "", type: "", color: .black))
//    }
//}
