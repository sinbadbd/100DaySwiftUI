//
//  DiscoverViewModel.swift
//  MovieDB-SwiftUI
//
//  Created by Imran on 26/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import Foundation

struct MovieResultViewModel {
    
    let result : Result
    
    var voteCount : Int {
        return result.voteCount
    }
    var video : Bool {
        return result.video
    }
    var voteAverage: Double {
        return result.voteAverage
    }
    var title: String {
        return result.title
    }
    var popularity: Double {
        return result.popularity
    }
    var posterPath: String {
        let url = URL(string:"https://image.tmdb.org/t/p/w500")!
        return "\(url)\(result.posterPath ?? "")"
    }
    var originalLanguage: String {
        return result.originalLanguage
    }
    var originalTitle: String {
        return result.originalTitle
    }
    //    var genreids: Double {
    //        return result.[genreids]
    //    }
    var backdropPath: String {
        let url = URL(string:"https://image.tmdb.org/t/p/w500")!
        return "\(url)\(result.backdropPath ?? "")"
    }
    var adult: Bool {
        return result.adult
    }
    
    var releaseDate: String {
        return result.releaseDate
    }
}

/*
 var backdropURL: URL {
     return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
 }
 
 var posterURL: URL {
     return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
 }
 let voteCount: Int
 let id: Int
 let video: Bool
 let voteAverage: Double
 let title: String
 let popularity: Double
 let posterPath: String?
 let originalLanguage: String
 let originalTitle: String
 let genreids: [Int]
 let backdropPath: String?
 let adult: Bool
 let overview: String
 let releaseDate: String
 
 */
