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
//    static var baseURL
    
    init(movie:Movie) {
        self.movie = movie
    }
    
    func getMovieReviews(){
//        getReviews(for: reviews)
    }
    private func getReviews(for movie: Movie){
        let urlString = "\(API.BASE_URL)movie/\(movie.id ?? 100)?api_key=\(API.API_KEY)"
//        NetworkManager<ReviewResponse>.fec
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
