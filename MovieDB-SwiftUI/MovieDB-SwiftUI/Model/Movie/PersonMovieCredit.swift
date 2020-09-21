//
//  PersonMovieCredit.swift
//  TheMovies
//
//  Created by Sinbad on 14/1/20.
//  Copyright © 2020 sinbad. All rights reserved.
//
 
import Foundation

// MARK: - PersonMovieCredit
struct PersonMovieCredit: Decodable {
    let cast, crew: [Cast]?
    let id: Int?
}

// MARK: - Cast
struct Cast: Decodable {
    let character, creditID, releaseDate: String?
    let voteCount: Int?
    let video, adult: Bool?
    let voteAverage: Double?
    let title: String?
    let genreIDS: [Int]?
    let originalTitle: String?
    let popularity: Double?
    let id: Int?
    let backdropPath: String?
    let overview: String?
    let posterPath: String?

    enum CodingKeys: String, CodingKey {
        case character
        case creditID = "credit_id"
        case releaseDate = "release_date"
        case voteCount = "vote_count"
        case video, adult
        case voteAverage = "vote_average"
        case title
        case genreIDS = "genre_ids"
        case originalTitle = "original_title"
        case popularity, id
        case backdropPath = "backdrop_path"
        case overview
        case posterPath = "poster_path"
    }
}
