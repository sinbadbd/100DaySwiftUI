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
            Spacer(minLength: 0)
        }
    }
}
