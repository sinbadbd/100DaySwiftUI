//
//  MarkFavorite.swift
//  TheMovies
//
//  Created by sinbad on 8/23/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import Foundation

struct MarkFavorite: Codable {
    let mediaType: String
    let mediaId: Int
    let favorite: Bool
    
    enum CodingKeys: String, CodingKey {
        case mediaType = "media_type"
        case mediaId = "media_id"
        case favorite = "favorite"
    }
    
}
