//
//  MovieServices.swift
//  MovieDB-SwiftUI
//
//  Created by Imran on 16/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import Foundation
/*
protocol MovieServices {
    func fetchMovies(from endpoint: MovieListEndpoing, completion: @escaping (Result<Moviex, MovieError>) -> ())
    func fetchMovie(id: Int, completion: @escaping(Result<Moviex, MovieError>) -> ())
    func searchMovie(query: String, completion: @escaping(Moviex, MovieError) -> ())
}

enum MovieListEndpoing : String, CaseIterable {
    case nowPlaing = "now_playing"
    case upcomming
    case toprated = "top_rated"
    case popular
    
    var description: String {
        switch self {
        case .nowPlaing:
            return "Now Playing"
        case .upcomming:
            return "Upcomming"
        case .toprated:
            return "Top Rated"
        case .popular:
            return "Popular"
        }
    }
}

enum MovieError : Error, CustomNSError {
    case apiError
    case invalidError
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription: String {
        switch self {
            case .apiError:
                return "Failed to fetch data!"
            case .invalidError:
                return "Invalid api!"
            case .invalidResponse:
                return "Invalid response!"
            case .noData:
                return "no data"
            case .serializationError:
                return "Failed to to decode data!"
        }
    }
}
 /**/*/
