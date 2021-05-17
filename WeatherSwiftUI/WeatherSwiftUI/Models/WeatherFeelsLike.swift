//
//  WeatherFeelsLike.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 17, 2021

import Foundation

struct WeatherFeelsLike : Codable {

        let day : Float?
        let eve : Float?
        let morn : Float?
        let night : Float?

        enum CodingKeys: String, CodingKey {
                case day = "day"
                case eve = "eve"
                case morn = "morn"
                case night = "night"
        }
    
//        init(from decoder: Decoder) throws {
//                let values = try decoder.container(keyedBy: CodingKeys.self)
//                day = try values.decodeIfPresent(Float.self, forKey: .day)
//                eve = try values.decodeIfPresent(Float.self, forKey: .eve)
//                morn = try values.decodeIfPresent(Float.self, forKey: .morn)
//                night = try values.decodeIfPresent(Float.self, forKey: .night)
//        }

}
