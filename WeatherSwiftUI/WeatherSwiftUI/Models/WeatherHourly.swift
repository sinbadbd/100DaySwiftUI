//
//  WeatherHourly.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 17, 2021

import Foundation

struct WeatherHourly : Codable,Identifiable {
        var id = UUID()
        let clouds : Int?
        let dewPoint : Float?
        let dt : Int?
        let feelsLike : Float?
        let humidity : Int?
//        let pop : Float?
        let pressure : Int?
        let rain : WeatherRain?
        let temp : Float?
//        let uvi : Int?
        let visibility : Int?
        let weather : [Weather]?
        let windDeg : Int?
        let windGust : Float?
        let windSpeed : Float?

        enum CodingKeys: String, CodingKey {
                case clouds = "clouds"
                case dewPoint = "dew_point"
                case dt = "dt"
                case feelsLike = "feels_like"
                case humidity = "humidity"
//                case pop = "pop"
                case pressure = "pressure"
                case rain = "rain"
                case temp = "temp"
//                case uvi = "uvi"
                case visibility = "visibility"
                case weather = "weather"
                case windDeg = "wind_deg"
                case windGust = "wind_gust"
                case windSpeed = "wind_speed"
        }
}
