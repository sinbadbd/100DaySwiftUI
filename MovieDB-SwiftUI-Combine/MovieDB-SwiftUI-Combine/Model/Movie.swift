//
//  Movie.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 1/2/21.
//

import Foundation

struct MovieResponse : Codable{
    var results: [Movie]
}

struct Movie: Codable, Identifiable {
    var id: Int?
    var title: String?
    var original_language: String?
    var overview: String?
    var poster_path: String?
    var popularity: Double?
    var vote_average: Double?
    var vote_count: Double?
    var video: Bool?
    var adult: Bool?
    var release_date: String?
//    var original_language: String?
    
    var posterPath: String{
        if let path = poster_path {
            return "https://image.tmdb.org/t/p/original/\(path)"
        }else {
            return ""
        }
    }
    var voteAverage: Double{
        if let avg = vote_average{
            return avg/10.0
        }
        return 0.0
    }
    
    var titleWithLanguage: String{
        guard let title = title, let lang = original_language else {
           return ""
        }
        return "\(title) (\(lang))"
    }
}
