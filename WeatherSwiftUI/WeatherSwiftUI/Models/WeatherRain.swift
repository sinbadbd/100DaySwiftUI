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
}
