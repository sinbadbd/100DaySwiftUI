//
//  MovieReviewView.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 1/2/21.
//

import SwiftUI

struct MovieReviewView: View {
    var movie: Movie
    
    @ObservedObject var movieReviewMgr : MovieReviewManager
    
    init(movie: Movie) {
        self.movie = movie
        self.movieReviewMgr = MovieReviewManager(movie: movie)
        //
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().selectionStyle = .none
        
        UINavigationBar.appearance().backgroundColor = .clear
        
    }
    
    
    var body: some View {
        ZStack(alignment: .top){
            List{
                ForEach(movieReviewMgr.reviews) { review in
                    VStack(alignment:.leading){
                        Text(review.author ?? "")
                            .padding()
                            .font(.title2)
                        
                        Text(review.content ?? "")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
            }
            .onAppear{
                movieReviewMgr.getMovieReviews()
            }
        }.padding()
        .edgesIgnoringSafeArea(.all)
        
    }
}
