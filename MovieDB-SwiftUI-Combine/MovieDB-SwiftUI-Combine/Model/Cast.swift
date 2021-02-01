//
//  Cast.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 1/2/21.
//

import Foundation

struct CastResponse:Codable {
    var cast: [Cast]
}
struct Cast: Codable, Identifiable {
    var id: Int?
    var name: String?
    var character: String?
    var profile_path: String?
    var profilePhoto: String{
        if let path = profile_path {
            return "https://image.tmdb.org/t/p/original/\(path)"
        }else {
            return "https://picsum.photos/200/300"
        }
       
    }
    
}
/*
 

    "adult": false,
    "gender": 2,
    "id": 504,
    "known_for_department": "Acting",
    "name": "Tim Robbins",
    "original_name": "Tim Robbins",
    "popularity": 2.901,
    "profile_path": "/hsCu1JUzQQ4pl7uFxAVFLOs9yHh.jpg",
    "cast_id": 3,
    "character": "Andy Dufresne",
    "credit_id": "52fe4231c3a36847f800b131",
    "order": 0
 
 
 */
