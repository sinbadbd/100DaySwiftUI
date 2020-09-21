//
//  MarkFavoriteResponse.swift
//  TheMovies
//
//  Created by sinbad on 8/23/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import Foundation

struct MarkFavoriteResponse: Codable {
    let success: Bool
    let statusCode: Int
    let statusMessage: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}

extension MarkFavoriteResponse: LocalizedError {
    var errorDescription: String? {
        return statusMessage
    }
}
