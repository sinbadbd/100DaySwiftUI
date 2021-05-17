//
//  WeatherRain.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 17, 2021

import Foundation

struct WeatherRain : Codable {

        let rainHour : Float?

        enum CodingKeys: String, CodingKey {
                case rainHour = "1h"
        }
    
//        init(from decoder: Decoder) throws {
//                let values = try decoder.container(keyedBy: CodingKeys.self)
//                rainHour = try values.decodeIfPresent(Float.self, forKey: .rainHour)
//        }

}
