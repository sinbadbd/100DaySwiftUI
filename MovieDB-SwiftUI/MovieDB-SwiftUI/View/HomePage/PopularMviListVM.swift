//
//  PopularMovieListVM.swift
//  MovieDB-SwiftUI
//
//  Created by Imran on 27/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import SwiftUI

struct PopularMviListVM: View {
    
    let popularListMovie : [MovieResultViewModel]
    
    var body: some View {
        HStack {
            Text("Popular Movie").font(.title)
            Spacer(minLength: 0)
            Button(action: {}) {
                Image(systemName: "chevron.right.2")
                    .renderingMode(.original)
                    .frame(width: 30, height: 30)
            }
        }.padding(.vertical,10)
        .padding(.horizontal,20)
        .border(Color.gray, width: 0.5)
        
        LazyVStack{
            ScrollView(.horizontal,  showsIndicators: false) {
                LazyHStack{
                    ForEach(self.popularListMovie, id: \.title){dis in
//                        NavigationLink(destination: MovieDetailsView(details: <#MovieDetailsViewModel#>)) {
//                            MovieListCell(result: dis)
//                        }
                    }
                } .padding()
            }
        }
    }
}

//struct PopularMovieListVM_Previews: PreviewProvider {
//    static var previews: some View {
//        PopularMovieListVM()
//    }
//}
/*
 
 NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
     MovieBackdropCard(movie: movie)
         .frame(width: 272, height: 200)
 }
 
 
 */
