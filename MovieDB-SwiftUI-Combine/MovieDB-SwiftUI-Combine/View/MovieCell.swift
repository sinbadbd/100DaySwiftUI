//
//  MovieCell.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 1/2/21.
//

import SwiftUI

struct MovieCell: View {
    
    var movie : Movie
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            moviePoster
            VStack(alignment: .leading, spacing: 10){
                movieTitle
                HStack{
                    movieVotes
                    movieReleaseData
                }
                movieOverView
            }
        }
    }
    
    
    private var moviePoster : some View {
        
        AsyncImage(url: URL(string: movie.posterPath)!) {
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.5))
        } image: { (img) -> Image in
            Image(uiImage: img)
                .resizable()
        }.frame(width: 100, height: 160)
        .animation(.easeOut(duration: 0.5))
        .transition(.opacity)
        .cornerRadius(15)
        .shadow(radius: 15)
    }
    
    private var movieTitle : some View {
        Text(movie.title ?? "")
            .foregroundColor(.black)
            .font(.subheadline)
    }
    private var movieVotes: some View {
     
        VStack{
            ZStack{
                Circle()
                    .trim(from: 0, to: CGFloat(movie.voteAverage))
                    .stroke(Color.orange, lineWidth: 4)
                    .frame(width: 50)
                    .rotationEffect(.degrees(-90))
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke(Color.orange.opacity(0.2),lineWidth: 4)
                    .frame(width: 50)
                    .rotationEffect(.degrees(-90))
                Text(String.init(format: "%0.2f", movie.voteAverage))
                    .foregroundColor(.orange)
                    .font(.subheadline)
            }.frame(height: 80)
        }
       
    }
    
    private var movieReleaseData : some View {
        Text(movie.release_date ?? "")
    }
    private var movieOverView: some View {
        Text(movie.overview ?? "")
            .font(.caption2)
            .foregroundColor(.gray)
    }
}
//
//struct MovieCell_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieCell()
//    }
//}
