//
//  MovieCcredits.swift
//  TheMovies
//
//  Created by sinbad on 5/27/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let movieCcredits = try? newJSONDecoder().decode(MovieCcredits.self, from: jsonData)

import Foundation

// MARK: - MovieCcredits
struct MovieCcredits: Decodable {
    let id: Int?
    let cast: [MovieCast]?
    //let crew: [Crew]?
}

// MARK: - Cast
struct MovieCast: Decodable {
    let castID: Int?
    let character, creditID: String?
    let gender, id: Int?
    let name: String?
    let order: Int?
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
        case gender, id, name, order
        case profilePath = "profile_path"
    }
}
//
//// MARK: - Crew
//struct Crew: Decodable {
//    let creditID, department: String?
//    let gender, id: Int?
//    let job, name: String?
//    let profilePath: String?
//
//    enum CodingKeys: String, CodingKey {
//        case creditID = "credit_id"
//        case department, gender, id, job, name
//        case profilePath = "profile_path"
//    }
//}

