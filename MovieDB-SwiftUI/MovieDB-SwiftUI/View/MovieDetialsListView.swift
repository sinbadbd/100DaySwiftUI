//
//  MovieDetialsListView.swift
//  MovieDB-SwiftUI
//
//  Created by Imran on 27/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import SwiftUI

struct MovieDetialsListView: View {
    let movieId: Int
    @ObservedObject var details = MovieDetailsVM()
    
//    init() {
//      //  details.getMovieDetails(id: self.movieId)
//    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//struct MovieDetialsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetialsListView()
//    }
//}
