//
//  WeatherCurrent.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 17, 2021

import Foundation

struct WeatherCurrent : Codable {

        let clouds : Int?
        let dewPoint : Double?
        let dt : Double?
        let feelsLike : Float?
        let humidity : Int?
        let pressure : Int?
        let sunrise : Int?
        let sunset : Int?
        let temp : Float?
//        let uvi : Int?
        let visibility : Int?
        let weather : [Weather]?
        let windDeg : Int?
        let windSpeed : Float?

        enum CodingKeys: String, CodingKey {
                case clouds = "clouds"
                case dewPoint = "dew_point"
                case dt = "dt"
                case feelsLike = "feels_like"
                case humidity = "humidity"
                case pressure = "pressure"
                case sunrise = "sunrise"
                case sunset = "sunset"
                case temp = "temp"
//                case uvi = "uvi"
                case visibility = "visibility"
                case weather = "weather"
                case windDeg = "wind_deg"
                case windSpeed = "wind_speed"
        }
 
}
