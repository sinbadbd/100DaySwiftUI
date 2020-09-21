//
//  MarkWatchMovie.swift
//  MovieDB-v2
//
//  Created by Imran on 3/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import Foundation

struct MarkWatchMovieList: Codable {
    let mediaType: String
    let mediaId: Int
    let watchlist: Bool
    
    enum CodingKeys: String, CodingKey {
        case mediaType = "media_type"
        case mediaId = "media_id"
        case watchlist = "watchlist"
    }
    
}
