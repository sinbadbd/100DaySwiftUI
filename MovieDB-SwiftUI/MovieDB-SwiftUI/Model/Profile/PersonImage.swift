//
//  PersonImage.swift
//  TheMovies
//
//  Created by sinbad on 5/29/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

// MARK: - Profile
// MARK: - Profiles
struct Profile: Decodable {
    let profiles: [ProfileElement]?
    let id: Int?
    
    enum CodingKeys: String, CodingKey {
        case profiles = "profiles"
        case id = "id"
    }
}

// MARK: - ProfileElement
struct ProfileElement: Decodable {
    let iso639_1: String?
    let width: Int?
    let height: Int?
    let voteCount: Int?
    let voteAverage: Double?
    let filePath: String?
    let aspectRatio: Double?
    
    enum CodingKeys: String, CodingKey {
        case iso639_1 = "iso_639_1"
        case width = "width"
        case height = "height"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case filePath = "file_path"
        case aspectRatio = "aspect_ratio"
    }
}
