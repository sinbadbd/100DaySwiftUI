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

/*
 
"adult": false,
"backdrop_path": "/srYya1ZlI97Au4jUYAktDe3avyA.jpg",
    "genre_ids": [
            14,
            28,
            12
    ],
"id": 464052,
"original_language": "en",
"original_title": "Wonder Woman 1984",
"overview": "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s and finds a formidable foe by the name of the Cheetah.",
"popularity": 3598.403,
"poster_path": "/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
"release_date": "2020-12-16",
"title": "Wonder Woman 1984",
"video": false,
"vote_average": 7,
"vote_count": 3222
 
 
 */
