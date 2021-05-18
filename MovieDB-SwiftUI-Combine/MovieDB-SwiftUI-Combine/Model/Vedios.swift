//
//  Vedios.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 2/2/21.
//

import Foundation

struct MovieVedio : Codable {
    var id:Int?
    var results: [Vedios]
}
struct Vedios: Codable, Identifiable {
    var id:String?
    var key:String?
    var name:String?
    var site: String?
    var type: String?
    var size: String?
}

/*
 
 "id": "533ec653c3a3685448000249",
          "iso_639_1": "en",
          "iso_3166_1": "US",
          "key": "K_tLp7T6U1c",
          "name": "The Shawshank Redemption - Trailer",
          "site": "YouTube",
          "size": 480,
          "type": "Trailer"
 
 
 */
