//
//  PostSession.swift
//  TheMovies
//
//  Created by sinbad on 6/30/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import Foundation

struct PostSession: Codable {
    
    let requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case requestToken = "request_token"
    }
    
}
