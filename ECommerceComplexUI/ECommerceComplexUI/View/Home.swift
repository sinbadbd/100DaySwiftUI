//
//  Home.swift
//  ECommerceComplexUI
//
//  Created by Imran on 28/1/21.
//

import SwiftUI

var tabs = ["Glasses", "Watched", "Shoes","Perfume"]


struct Home: View {
    
    @State var selected = tabs[0]
    @Namespace var animation
    
    @State var show = false
    @State var selectedItem: Item = items[0]
    
    var body: some View {
        ZStack{
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
                
                ScrollView {
                    VStack{
                        HStack{
                            VStack(alignment: .leading, spacing: 5){
                                Text("Let's")
                                    .font(.title)
                                    .foregroundColor(.black)
                                
                                Text("Get Started")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.black)
                            }
                            .padding(.horizontal)
                            Spacer(minLength: 0)
                        }
                        HStack(spacing: 0){
                            ForEach(tabs, id: \.self){ tab in
                                TabBarView(title: tab, selected: $selected, animation: animation)
                                if tabs.last !=  tab{Spacer(minLength: 0)}
                            }
                        }.padding()
                       
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 20){
                            ForEach(items){ items in
                                CardsView(item: items, animation: animation)
                                    .onTapGesture {
                                         withAnimation(
                                            .spring()) {
                                            selectedItem = items
                                            show.toggle()
                                         }
                                    }
                                    
                            }
                        }.padding()
                    }
                }
            }
            .opacity(show ? 0 : 1)
            if show {
                DetailsView(selectedItem: $selectedItem, show: $show, animation: animation)
            }
        }
        .background(Color.white.ignoresSafeArea())
        
    }
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

