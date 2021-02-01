//
//  Cast.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 1/2/21.
//

import Foundation

struct CastResponse:Codable {
    var results: [Cast]
}
struct Cast: Codable, Identifiable {
    var id: Int?
    var name: String?
    var charecter: String?
    var profile_path: String?
    var profilePhoto: String{
        if let path = profile_path {
           return "https://image.tmdb.org/t/p/original/\(path)"
        }
        return "https://picsum.photos/200/300"
    }
    
}
