//
//  WeatherTemp.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 17, 2021

import Foundation

struct WeatherTemp : Codable {

        let day : Float?
        let eve : Float?
        let max : Float?
        let min : Float?
        let morn : Float?
        let night : Float?

        enum CodingKeys: String, CodingKey {
                case day = "day"
                case eve = "eve"
                case max = "max"
                case min = "min"
                case morn = "morn"
                case night = "night"
        }
}
