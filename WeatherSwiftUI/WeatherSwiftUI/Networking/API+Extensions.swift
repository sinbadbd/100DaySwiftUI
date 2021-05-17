//
//  APIExtensions.swift
//  WeatherSwiftUI
//
//  Created by Imran on 17/5/21.
//

import Foundation

extension API {
    //https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&exclude={part}&appid={API key}
    static let baseURL = "https://api.openweathermap.org/data/2.5/"
    
    static func getURLFor(lat: Double, lon: Double) -> String {
        return "\(baseURL)onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(key)"
    }
}
