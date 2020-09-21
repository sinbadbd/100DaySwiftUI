//
//  NowPlayingMovie.swift
//  TheMovies
//
//  Created by sinbad on 5/21/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import Foundation

struct NowPlayingMovie : Decodable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results = "results"
    }
}
 
