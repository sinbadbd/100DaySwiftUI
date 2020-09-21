//
//  MovieReview.swift
//  MovieDB-v2
//
//  Created by Imran on 30/8/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import Foundation

// MARK: - MovieReview
struct MovieReview: Decodable {
    let id, page: Int
    let results: [MovieResult]?
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case id, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct MovieResult: Decodable {
    let author, content, id: String
    let url: String
}
