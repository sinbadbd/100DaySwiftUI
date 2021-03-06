//
//  Images.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 2/2/21.
//

import Foundation
struct MovieImageResponse:Codable {
    var id:Int?
    var backdrops: [ImagesList]
}
struct ImagesList: Codable, Identifiable {
    var id: String? // optional for Identifiable hence, got error
    var aspect_ratio: Double?
    var file_path: String?
    var height:Int?
    var width:Int?
    var vote_average: Double?
    
    var movieImage: String{
        if let path = file_path {
            return "https://image.tmdb.org/t/p/original\(path)"
        }else {
            return ""
        }
    }
}
/*
 
 "aspect_ratio": 1.777777777777778,
            "file_path": "/wzJRB4MKi3yK138bJyuL9nx47y6.jpg",
            "height": 1152,
            "iso_639_1": null,
            "vote_average": 5.334,
            "vote_count": 11,
            "width": 2048
 */
