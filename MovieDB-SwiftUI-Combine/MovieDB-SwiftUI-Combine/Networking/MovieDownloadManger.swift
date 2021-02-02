//
//  MovieDownloadManger.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 1/2/21.
//

import Foundation
import SwiftUI

final class MovieDownloadManager : ObservableObject {
    @Published var movies = [Movie]()
    @Published var cast   = [Cast]()
        
    func getNowPlaying(){
        getMovies(moveURL: .nowPlaying)
    }
    func getUpcomming(){
        getMovies(moveURL: .upcomming)
    }
    func getPopular(){
        getMovies(moveURL: .populur)
    }
    func getTopRated(){
        getMovies(moveURL: .topRated)
    }
    
    func getCast (for movie: Movie){
        let urlString = "\(API.BASE_URL)movie/\(movie.id ?? 100)/credits?api_key=\(API.API_KEY)&language=en-US"
        NetworkManager<CastResponse>.fetch(from: urlString) { (result) in
            switch result {
            case .success(let response):
              
                self.cast = response.cast
                print("respons: \( self.cast)")
            case .failure(let err):
                print(err)
            }
        }
    }
    
    
    func getMovies(moveURL: MovieURL){
        NetworkManager<MovieResponse>.fetch(from: moveURL.urlString) { (result) in
            switch result{
            case .success(let movieResponse):
                self.movies = movieResponse.results
                
            case .failure(let err):
                print(err)
            }
 
        }
    }
    
    func getSimilarMovie (for movie: Movie){
        let urlString = "\(API.BASE_URL)movie/\(movie.id ?? 100)/similar?api_key=\(API.API_KEY)&language=en-US"

        NetworkManager<MovieResponse>.fetch(from: urlString) { (result) in
            switch result{
            case .success(let movieResponse):
                self.movies = movieResponse.results
                
            case .failure(let err):
                print(err)
            }
        }
    }
    func getRecommandedMovie (for movie: Movie){
        let urlString = "\(API.BASE_URL)movie/\(movie.id ?? 100)/recommendations?api_key=\(API.API_KEY)&language=en-US"

        NetworkManager<MovieResponse>.fetch(from: urlString) { (result) in
            switch result{
            case .success(let movieResponse):
                self.movies = movieResponse.results
                
            case .failure(let err):
                print(err)
            }
 
        }
    }
    
}
