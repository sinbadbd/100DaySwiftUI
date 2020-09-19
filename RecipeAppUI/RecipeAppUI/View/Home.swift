//
//  Home.swift
//  RecipeAppUI
//
//  Created by Imran on 19/9/20.
//

import SwiftUI

struct Home: View {
    @State var search = ""
    @State var selectedTab = "Home"
    var body: some View {
        VStack{
            HStack{
                Button(action: {}){
                    Image(systemName: "line.horizontal.3")
                        .font(.title)
                        .foregroundColor(.black)
                }
                Spacer(minLength: 0)
                Button(action: {}){
                    Image("profile")
                        .renderingMode(.original)
                }
            }
            .padding([.horizontal,.bottom])
            .padding(.top,10)
//            Spacer(minLength: 0)
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    HStack( spacing: 15){
                        HStack( spacing: 10){
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("Search", text: $search)
//                            print("\(search)")
                        }
                        .padding()
                        .background(Color.black.opacity(0.06))
                        .cornerRadius(15)
                        
                        Button(action: {}){
                            Image("filter")
                                .renderingMode(.original)
                                .padding()
                                .background(Color("yellow").opacity(0.5))
                                .cornerRadius(15)
                        }
                    }
                    .padding(.horizontal)
                    
                    HStack{
                        Text("Top Recipes")
                            .font(.title)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                        Spacer(minLength: 0)
                    }
                        .padding()

                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 12){
                            ForEach(recipes, id: \.title){ recipes in
                                
                                RecipesCard(recipes: recipes)
                            }
                        }
                    }.padding()
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 5){
                            
                            ForEach(categories, id:\.self){title in
                                 CategoryCard(title: title)
                            }
                        }
                    }.padding()
                }
            }
            CustomTabBar(selectedTab: $selectedTab)
        }
        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))
                .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Home()
            Home()
                .previewDevice("iPhone SE (2nd generation)")
//            Home()
//                .previewDevice("iPad Pro (12.9-inch) (4th generation)")
        }
    }
}
