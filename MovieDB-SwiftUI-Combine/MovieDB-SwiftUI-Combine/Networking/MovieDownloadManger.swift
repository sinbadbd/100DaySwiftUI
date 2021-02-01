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
    
//    static var baseURL = API.BASE_URL
    
    func getNowPlaying (){
        getMovies(moveURL: .nowPlaying)
    }
    func getUpcomming(){
        getMovies(moveURL: .upcomming)
    }
    func getPopular(){
        getMovies(moveURL: .populur)
    }
    
    func getCast (for movie: Movie){
        let urlString = "\(API.BASE_URL)movie/\(movie.id ?? 100)/credits?api_key=\(API.API_KEY)&language=en-US"
        print("urlString:\(urlString)")
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
       // print(MovieURL.init(rawValue: moveURL.urlString))
        NetworkManager<MovieResponse>.fetch(from: moveURL.urlString) { (result) in
            switch result{
            case .success(let movieResponse):
                self.movies = movieResponse.results
                
            case .failure(let err):
                print(err)
            }
 
        }
    }
    
    func similarMovie(){
        
    }
    func getRecommandedMovie(){
        
    }
    
}
