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
    @ObservedObject private var popular   = PopularMovieListVM()
    @ObservedObject private var toprated  = TopRatedMovieModelVM()
    
    init() {
        discMovie.load()
        upcomming.load()
        popular.load()
        toprated.load()
    }
    
    var body: some View {
        VStack{
            TopBar()
            
            DiscoverList(disListMovie: self.discMovie.discover)
            UpCommingMovieList(disListMovie: self.upcomming.upcomming)
            PopularMviListVM(popularListMovie: self.popular.popular)
            TopRatedMovieListVM(topRated: self.toprated.topRated)
            // Top rated  Movie
            
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
