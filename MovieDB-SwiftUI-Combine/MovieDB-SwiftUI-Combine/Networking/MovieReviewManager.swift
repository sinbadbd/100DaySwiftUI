//
//  MovieReviewManager.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 1/2/21.
//
import Foundation
import SwiftUI

final class MovieReviewManager:ObservableObject {
   @Published var reviews = [Review]()
    
    private var movie: Movie
    
    init(movie:Movie) {
        self.movie = movie
    }
    
    func getMovieReviews(){
//        getReviews(for: reviews)
        getReviews(for: movie)
    }
    private func getReviews(for movie: Movie){
        let urlString = "\(API.BASE_URL)movie/\(movie.id ?? 100)/reviews?api_key=\(API.API_KEY)"
        print("urlString: \(urlString)")
        NetworkManager<ReviewResponse>.fetch(from: urlString) { (result) in
            switch result {
            case .success(let response):
                self.reviews = response.results
            case .failure(let err):
                print(err)
            }
        }
    }
}
