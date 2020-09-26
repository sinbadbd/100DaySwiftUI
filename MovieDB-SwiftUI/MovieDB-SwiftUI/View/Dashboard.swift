//
//  Dashboard.swift
//  MovieDB-SwiftUI
//
//  Created by Imran on 20/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import SwiftUI

struct Dashboard: View {
    
    @ObservedObject private var discMovie = DiscoverListModel()
    @ObservedObject private var upcomming = UpcommingMovieListVM()
    
    init() {
        discMovie.load()
        upcomming.load()
    }
    var body: some View {
        VStack{
            TopBar()
            
            DiscoverList(disListMovie: self.discMovie.discover)
            
            UpCommingMovieList(disListMovie: upcomming.upcomming)
            
            /*
            ScrollView(.horizontal,  showsIndicators: false) {
                VStack{
                    HStack{
                        ForEach(1...5, id:\.self){_ in
                            VStack{
                                
                                Image("hero")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 150, height: 240)
                                    .cornerRadius(10)
                                
                                Text("The Movie Db")
                                    .font(.title3)
                                    .foregroundColor(.black)
                                
                            }
                        }
                    }
                }.padding()
                
            }
 */
            
            
            // Now Playing Movie
            
            // Popular  Movie
            
            // Top rated  Movie
            
            // Now Playing Movie
            
            Spacer(minLength: 0)
            
            
        }
        //        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))
        //                .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Dashboard()
                .previewDevice("iPhone 11 Pro Max")
            //            Dashboard()
            //                .previewDevice("iPhone SE (2nd generation)")
            //            Dashboard()
            //                .previewDevice("iPod touch (7th generation)")
            //            Dashboard()
            //                .previewDevice("iPad Pro (12.9-inch) (4th generation)")
        }
    }
}
