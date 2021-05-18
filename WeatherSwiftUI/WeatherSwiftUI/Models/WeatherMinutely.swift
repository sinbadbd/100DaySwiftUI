//
//  WeatherMinutely.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 17, 2021

import Foundation

struct WeatherMinutely : Codable {

        let dt : Int?
        let precipitation : Int?

        enum CodingKeys: String, CodingKey {
                case dt = "dt"
                case precipitation = "precipitation"
        }
}
