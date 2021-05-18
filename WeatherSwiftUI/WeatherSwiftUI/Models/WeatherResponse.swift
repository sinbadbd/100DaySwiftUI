//
//  WeatherResponse.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 17, 2021

import Foundation

struct WeatherResponse : Codable {

        let current : WeatherCurrent?
         let daily : [WeatherDaily]?
         let hourly : [WeatherHourly]?
        let lat : Float?
        let lon : Float?
        let minutely : [WeatherMinutely]?
        let timezone : String?
        let timezoneOffset : Int?

        enum CodingKeys: String, CodingKey {
                case current = "current"
             case daily = "daily"
                 case hourly = "hourly"
                case lat = "lat"
                case lon = "lon"
                 case minutely = "minutely"
                case timezone = "timezone"
                case timezoneOffset = "timezone_offset"
        }
}
