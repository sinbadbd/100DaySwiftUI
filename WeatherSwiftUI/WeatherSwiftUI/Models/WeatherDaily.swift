//
//  WeatherDaily.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 17, 2021

import Foundation

struct WeatherDaily : Codable , Identifiable{
    var id = UUID()
        let clouds : Int?
        let dewPoint : Float?
        let dt : Int?
        let feelsLike : WeatherFeelsLike?
        let humidity : Int?
        let moonPhase : Float?
        let moonrise : Int?
        let moonset : Int?
//        let pop : Int?
        let pressure : Int?
        let rain : Float?
        let sunrise : Int?
        let sunset : Int?
        let temp : WeatherTemp?
//        let uvi : Int?
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
                case moonPhase = "moon_phase"
                case moonrise = "moonrise"
                case moonset = "moonset"
//                case pop = "pop"
                case pressure = "pressure"
                case rain = "rain"
                case sunrise = "sunrise"
                case sunset = "sunset"
                case temp = "temp"
//                case uvi = "uvi"
                case weather = "weather"
                case windDeg = "wind_deg"
                case windGust = "wind_gust"
                case windSpeed = "wind_speed"
        }
 
}
