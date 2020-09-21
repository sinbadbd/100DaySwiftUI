//
//  LoginRequest.swift
//  TheMovies
//
//  Created by sinbad on 6/30/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import Foundation
struct LoginRequest : Codable {
    let username : String
    let password : String
    let requestToken : String
    
    enum CodingKeys: String, CodingKey {
        case username
        case password
        case requestToken = "request_token"
    }
}
