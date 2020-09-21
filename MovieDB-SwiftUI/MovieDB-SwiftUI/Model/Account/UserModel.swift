//
//  UserModel.swift
//  MovieDB-v2
//
//  Created by Imran on 17/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import Foundation

// MARK: - UserModel
struct UserModel: Codable {
    let avatar: Avatar
    let id: Int
    let iso639_1: String
    let iso3166_1: String
    let name: String
    let includeAdult: Bool
    let username: String

    enum CodingKeys: String, CodingKey {
        case avatar = "avatar"
        case id = "id"
        case iso639_1 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case name = "name"
        case includeAdult = "include_adult"
        case username = "username"
    }
}

// MARK: - Avatar
struct Avatar: Codable {
    let gravatar: Gravatar

    enum CodingKeys: String, CodingKey {
        case gravatar = "gravatar"
    }
}

// MARK: - Gravatar
struct Gravatar: Codable {
    let hash: String

    enum CodingKeys: String, CodingKey {
        case hash = "hash"
    }
}
