//
//  WeatherHourly.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 17, 2021

import Foundation

struct WeatherHourly : Codable {

        let clouds : Int?
        let dewPoint : Float?
        let dt : Int?
        let feelsLike : Float?
        let humidity : Int?
        let pop : Float?
        let pressure : Int?
        let rain : WeatherRain?
        let temp : Float?
        let uvi : Int?
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
                case pop = "pop"
                case pressure = "pressure"
                case rain = "rain"
                case temp = "temp"
                case uvi = "uvi"
                case visibility = "visibility"
                case weather = "weather"
                case windDeg = "wind_deg"
                case windGust = "wind_gust"
                case windSpeed = "wind_speed"
        }
    
//        init(from decoder: Decoder) throws {
//                let values = try decoder.container(keyedBy: CodingKeys.self)
//                clouds = try values.decodeIfPresent(Int.self, forKey: .clouds)
//                dewPoint = try values.decodeIfPresent(Float.self, forKey: .dewPoint)
//                dt = try values.decodeIfPresent(Int.self, forKey: .dt)
//                feelsLike = try values.decodeIfPresent(Float.self, forKey: .feelsLike)
//                humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
//                pop = try values.decodeIfPresent(Float.self, forKey: .pop)
//                pressure = try values.decodeIfPresent(Int.self, forKey: .pressure)
//                rain = try WeatherRain(from: decoder)
//                temp = try values.decodeIfPresent(Float.self, forKey: .temp)
//                uvi = try values.decodeIfPresent(Int.self, forKey: .uvi)
//                visibility = try values.decodeIfPresent(Int.self, forKey: .visibility)
//                weather = try values.decodeIfPresent([Weather].self, forKey: .weather)
//                windDeg = try values.decodeIfPresent(Int.self, forKey: .windDeg)
//                windGust = try values.decodeIfPresent(Float.self, forKey: .windGust)
//                windSpeed = try values.decodeIfPresent(Float.self, forKey: .windSpeed)
//        }

}
