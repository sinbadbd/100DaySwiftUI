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
            
            if discMovie.discover.count > 0 {
                DiscoverList(disListMovie: self.discMovie.discover)
            }else {
                VStack{
                    Text("Discover movie load faild!").foregroundColor(Color.red)
                }
            }
            if self.upcomming.upcomming.count > 0 {
                
                UpCommingMovieList(disListMovie: self.upcomming.upcomming)
            }else {
                VStack{
                    Text("Upcomming movie load faild!").foregroundColor(Color.red)
                }
            }
            if self.popular.popular.count > 0 {
                
                PopularMviListVM(popularListMovie: self.popular.popular)
            }else {
                VStack{
                    Text("Popular movie load faild!").foregroundColor(Color.red)
                }
            }
            if self.toprated.topRated.count > 0 {
                
                TopRatedMovieListVM(topRated: self.toprated.topRated)
            }else {
                VStack{
                    Text("Top Rated movie load faild!").foregroundColor(Color.red)
                }
            }
            
            /*
            Button( action: {}){
                NavigationLink(destination: MovieDetailsView()){
                    
                    Text("next")
                }
            }*/
            
            Spacer(minLength: 0)
        }
    }
}
