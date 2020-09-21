//
//  RataingMovie.swift
//  MovieDB-v2
//
//  Created by Imran on 3/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import Foundation
//class RatingMovie: Codable {
//   let value: Double
//
//    enum CodingKeys: String, CodingKey {
//          case value = "value"
//      }
//}
// MARK: - XShopOrderResponse
class RatingMovie: Codable {
    let value: Double

    init(value: Double) {
        self.value = value
    }
}
