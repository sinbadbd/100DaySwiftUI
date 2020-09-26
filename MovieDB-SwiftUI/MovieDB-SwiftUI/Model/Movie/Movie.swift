//
//  Movie.swift
//  TheMovies
//
//  Created by sinbad on 5/22/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import Foundation
import SwiftUI

struct Movie : Decodable { 
    let page: Int?
    let results: [Result]?
    let totalPages: Int?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

