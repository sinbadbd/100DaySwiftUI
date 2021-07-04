//
//  HomeView.swift
//  Instagram-SwiftUI
//
//  Created by Imran on 4/7/21.
//

import SwiftUI

struct HomeView: View {
 
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false){
                
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    ForEach(0..<10) {_ in
                        LazyHStack{
                            
                            MyStoryView().frame(width: 50)
//                                .background(Color.red)
//                                .padding()
                        }
                    }
                }
                .padding(.top, 20)
                .padding(.leading, 10)
                .frame(height: 80)
            }
//            .background(Color.green)
         
                ForEach(0..<10) {_ in
                    PostView()
                        .padding(.bottom, 15)
                }
            }
            
            Spacer(minLength: 0)
            
                
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
