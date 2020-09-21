//
//  RequesTokenResponse.swift
//  TheMovies
//
//  Created by sinbad on 6/30/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import Foundation
struct RequesTokenResponse : Decodable {
    let success : Bool
    let expiresAt: String
    let requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }
}
